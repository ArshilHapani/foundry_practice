//SPDX-License-Identifier:MIT

pragma solidity 0.8.24;

import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import {DecentralizedStableCoin} from "./DecentralizedStableCoin.sol";
import {Errors} from "./utils/Errors.sol";
import {DSCEngineEvents} from "./utils/Events.sol";

/*
 * @title DSCEngine
 * @author Arshil Hapani
 * Token maintain  1$ to 1 DSC
 * Properties of this stable coin
 * - Exogenous collateral
 * - Algorithmic minting
 * - Dollar pegged
 *
 * It is similar to DAI to DAI has no governance, no fees, and was only backed by wETH and wBTC.
 *
 * @notice This contract is core of DSC system. It handles all the logic for minting and redeeming DSC, as well as depositing and withdrawing collateral.
 */
contract DSCEngine is ReentrancyGuard {
    uint256 private constant ADDITIONAL_PRICE_PRECISION = 1e10;
    uint256 private constant PRECISION = 1e18;
    uint256 private constant LIQUIDATION_THRESHOLD = 50; // 200% over collateralized (double)
    uint256 private constant LIQUIDATION_PRECISION = 100;
    uint256 private constant MIN_HEALTH_FACTOR = 1e18;
    uint256 private constant LIQUIDATION_BONUS = 10;

    DecentralizedStableCoin private immutable i_decentralizedStableCoin;

    mapping(address tokens => address priceFeeds) private s_priceFeeds;
    mapping(address user => mapping(address token => uint256 collateral)) private s_collateralDeposited;
    mapping(address user => uint256 dscMinted) private s_dscMinted;
    address[] private s_collateralTokens;

    constructor(address[] memory _tokenAddresses, address[] memory _priceFeedAddresses, address _dscAddress) {
        if (_tokenAddresses.length != _priceFeedAddresses.length) {
            revert Errors.DSCEngine__ArrayLengthMismatch();
        }

        for (uint256 i = 0; i < _tokenAddresses.length; i++) {
            s_priceFeeds[_tokenAddresses[i]] = _priceFeedAddresses[i];
            s_collateralTokens.push(_tokenAddresses[i]);
        }

        i_decentralizedStableCoin = DecentralizedStableCoin(_dscAddress);
    }
    /**
     * @notice this function will deposit collateral and mint DSC in one transaction
     * @param _tokenCollateralAddress Which token to deposit as collateral (ETH, BTC)
     * @param _amountCollateral Amount of token to deposit as collateral
     * @param _amountDSCToMint Amount of DSC to mint
     */

    function depositCollateralAndMintDsc(
        address _tokenCollateralAddress,
        uint256 _amountCollateral,
        uint256 _amountDSCToMint
    ) external {
        depositCollateral(_tokenCollateralAddress, _amountCollateral);
        mintDsc(_amountDSCToMint);
    }

    /**
     * @notice follows CEI (Checks Effects Interactions) pattern
     * @param _tokenCollateralAddress The address of the token to be deposited as collateral
     * @param _tokenCollateral The amount of the token to be deposited as collateral
     */
    function depositCollateral(address _tokenCollateralAddress, uint256 _tokenCollateral)
        public
        moreThanZero(_tokenCollateral)
        isAllowedToken(_tokenCollateralAddress)
        nonReentrant
    {
        s_collateralDeposited[msg.sender][_tokenCollateralAddress] += _tokenCollateral;
        emit DSCEngineEvents.CollateralDeposited(msg.sender, _tokenCollateralAddress, _tokenCollateral);
        bool success = IERC20(_tokenCollateralAddress).transferFrom(msg.sender, address(this), _tokenCollateral);
        if (!success) {
            revert Errors.DSCEngine__TransferFailed();
        }
    }

    /**
     * @param _amountDSCToMint The amount of DSC to mint
     * @notice Check if the collateral value > DSC value
     */
    function mintDsc(uint256 _amountDSCToMint) public moreThanZero(_amountDSCToMint) nonReentrant {
        s_dscMinted[msg.sender] += _amountDSCToMint;
        // prevent user from minting more DSC than the value of the collateral
        _revertIfHealthFactorIsBroken(msg.sender);
        bool minted = i_decentralizedStableCoin.mint(msg.sender, _amountDSCToMint);

        if (!minted) {
            revert Errors.DSCEngine__MintFailed();
        }
    }

    /**
     * this function burn DSC and redeem underlying collateral
     */
    function redeemCollateralForDsc(
        address _tokenCollateralAddress,
        uint256 _amountCollateral,
        uint256 _amountDSCToBurn
    ) external {
        burnDsc(_amountDSCToBurn);
        redeemCollateral(_tokenCollateralAddress, _amountCollateral);
        // redeem collateral already checks for health factor
    }

    /**
     * redeemCollateral
     * @notice for redeeming collateral the health factor should be greater than 1
     */
    function redeemCollateral(address _tokenCollateralAddress, uint256 _amountCollateral)
        public
        moreThanZero(_amountCollateral)
        nonReentrant
    {
        _redeemCollateral(_tokenCollateralAddress, _amountCollateral, msg.sender, msg.sender);
        _revertIfHealthFactorIsBroken(msg.sender);
    }

    function burnDsc(uint256 _amount) public moreThanZero(_amount) {
        _burnDSC(_amount, msg.sender, msg.sender);
        _revertIfHealthFactorIsBroken(msg.sender);
    }

    /**
     * If we do not start nearing undercollateralization, we will need someone to liquidate the user
     *
     * $100 ETH back $50 DSC
     * If eth price drops to $20, then $20 ETH doesn't worth $50 DSC
     *
     * $75 Backing $50 DSC
     * Liquidator take $75 backing and burns $50 DSC
     */

    /**
     *
     * @param _collateral Token address of the collateral
     * @param _user address of the user who has broken health factor
     * @param _debtToCover total debt to cover
     *
     * @notice we can partially liquidate the user
     * @notice you will get liquidation bonus for taking the users fund (take $75 collateral and provide $50 DSC)
     */
    function liquidate(address _collateral, address _user, uint256 _debtToCover)
        external
        moreThanZero(_debtToCover)
        nonReentrant
    {
        // Need to check their health factor
        uint256 startingUserHealthFactor = _healthFactor(_user);
        if (startingUserHealthFactor >= MIN_HEALTH_FACTOR) {
            revert Errors.DSCEngine__HealthFactorNotBroken();
        }

        /**
         * we want to burn their DSC "debt"
         * and take their collateral
         * Bad user: $140 ETH $100 DSC
         * debtToCover = $100
         */
        uint256 tokenAmountOfDebtToCover = getTokenAmountFromUsd(_collateral, _debtToCover);
        _redeemCollateral(_collateral, tokenAmountOfDebtToCover, _user, msg.sender);
        _burnDSC(_debtToCover, _user, msg.sender);

        uint256 endingUserHealthFactor = _healthFactor(_user);
        if (endingUserHealthFactor <= startingUserHealthFactor) {
            revert Errors.DSCEngine__HealthFactorNotImproved();
        }
        _revertIfHealthFactorIsBroken(msg.sender);
    }

    function calculateHealthFactor(uint256 _totalDSCMinted, uint256 _totalCollateralValueInUSD)
        public
        pure
        returns (uint256)
    {
        return _calculateHealthFactor(_totalDSCMinted, _totalCollateralValueInUSD);
    }

    // 1, Check health factor. Do they have enough collateral
    // 2. Revert if health factor is broken
    function _revertIfHealthFactorIsBroken(address _user) internal view {
        uint256 userHealthFactor = _healthFactor(_user);
        if (userHealthFactor < MIN_HEALTH_FACTOR) {
            revert Errors.DSCEngine__HealthFactorTooLow(userHealthFactor);
        }
    }

    function _redeemCollateral(address _tokenCollateralAddress, uint256 _amountCollateral, address _from, address _to)
        private
    {
        s_collateralDeposited[_from][_tokenCollateralAddress] -= _amountCollateral;
        emit DSCEngineEvents.CollateralRedeemed(_from, _to, _tokenCollateralAddress, _amountCollateral);

        bool success = IERC20(_tokenCollateralAddress).transfer(_to, _amountCollateral);

        if (!success) {
            revert Errors.DSCEngine__TransferFailed();
        }
    }

    function _burnDSC(uint256 _amount, address _onBehalfOf, address _dscFrom) private {
        s_dscMinted[_onBehalfOf] -= _amount;

        bool success = i_decentralizedStableCoin.transferFrom(_dscFrom, address(this), _amount);
        if (!success) {
            revert Errors.DSCEngine__TransferFailed();
        }
        i_decentralizedStableCoin.burn(_amount);
    }

    /**
     * @return How close the user is to being liquidated, if user go below 1, they will be liquidated
     * @param _user The address of the user
     */
    function _healthFactor(address _user) private view returns (uint256) {
        // required field -> DSC minted, total collateral value (USD)
        (uint256 totalDSCMinted, uint256 collateralValueInUSD) = _getAccountInformation(_user);
        uint256 collateralAdjustedThreshold = (collateralValueInUSD * LIQUIDATION_THRESHOLD) / LIQUIDATION_PRECISION;

        return (collateralAdjustedThreshold * PRECISION) / totalDSCMinted; // < 1 means liquidated
    }

    function _getAccountInformation(address _user)
        private
        view
        returns (uint256 totalDSCMinted, uint256 totalCollateralValue)
    {
        totalDSCMinted = s_dscMinted[_user];
        totalCollateralValue = getTotalCollateralValue(_user);
    }

    function _calculateHealthFactor(uint256 _totalDSCMinted, uint256 _totalCollateralValueInUSD)
        private
        pure
        returns (uint256)
    {
        if (_totalDSCMinted == 0) return type(uint256).max; // if someone have 0 DSC minted and deposited ton of collateral then it's dsc minted is 0 and if we divide by 0 then it will revert
        uint256 collateralAdjustedFromThreshold =
            (_totalCollateralValueInUSD * LIQUIDATION_THRESHOLD) / LIQUIDATION_PRECISION;

        return (collateralAdjustedFromThreshold * 1e18) / _totalDSCMinted;
    }

    function getHealthFactor(address user_) external view returns (uint256) {
        return _healthFactor(user_);
    }

    function getTotalCollateralValue(address _user) public view returns (uint256) {
        address[] memory m_collateralToken = s_collateralTokens; // gas optimization
        uint256 totalCollateralValue;
        for (uint256 i = 0; i < m_collateralToken.length; i++) {
            address token = m_collateralToken[i];
            uint256 amount = s_collateralDeposited[_user][token];
            totalCollateralValue += getUSDValue(token, amount);
        }
        return totalCollateralValue;
    }

    function getUSDValue(address _token, uint256 _amount) public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(s_priceFeeds[_token]);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return ((uint256(price) * ADDITIONAL_PRICE_PRECISION) * _amount) / PRECISION;
    }

    function getTokenAmountFromUsd(address _token, uint256 _usdAmount) public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(s_priceFeeds[_token]);
        (, int256 price,,,) = priceFeed.latestRoundData();
        uint256 tokenAmountFromDebtCover = (_usdAmount * PRECISION) / (uint256(price) * ADDITIONAL_PRICE_PRECISION);
        // 10% bonus
        uint256 bonusCollateral = (tokenAmountFromDebtCover * LIQUIDATION_BONUS) / LIQUIDATION_PRECISION;
        uint256 totalCollateralToRedeem = tokenAmountFromDebtCover + bonusCollateral;
        return totalCollateralToRedeem;
    }

    function getAccountInformation(address _user) external view returns (uint256, uint256) {
        return _getAccountInformation(_user);
    }

    function getCollateralTokens() external view returns (address[] memory) {
        return s_collateralTokens;
    }

    function getCollateralBalanceOfUser(address user_, address token_) external view returns (uint256) {
        return s_collateralDeposited[user_][token_];
    }

    /////////////////////// Modifiers ///////////////////////

    modifier moreThanZero(uint256 _amount) {
        if (_amount <= 0) {
            revert Errors.DSCEngine__MustBeGreaterThanZero();
        }
        _;
    }

    modifier isAllowedToken(address _token) {
        if (s_priceFeeds[_token] == address(0)) {
            revert Errors.DSCEngine__NotAllowedToken();
        }
        _;
    }
}
