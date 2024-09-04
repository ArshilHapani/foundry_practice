//SPDX-License-Identifier:MIT

pragma solidity 0.8.24;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
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
    uint256 private constant MIN_HEALTH_FACTOR = 1;

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

    function depositCollateralAndMintDsc() external {
        // Logic for depositing collateral and minting DSC
    }

    /**
     * @notice follows CEI (Checks Effects Interactions) pattern
     * @param _tokenCollateralAddress The address of the token to be deposited as collateral
     * @param _tokenCollateral The amount of the token to be deposited as collateral
     */
    function depositCollateral(address _tokenCollateralAddress, uint256 _tokenCollateral)
        external
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
    function mintDsc(uint256 _amountDSCToMint) external moreThanZero(_amountDSCToMint) nonReentrant {
        s_dscMinted[msg.sender] += _amountDSCToMint;
        // prevent user from minting more DSC than the value of the collateral
        _revertIfHealthFactorIsBroken(msg.sender);
    }

    function redeemCollateralForDsc() external {
        // Logic for redeeming collateral for DSC
    }

    function redeemCollateral() external {
        // Logic for redeeming collateral
    }

    function burnDsc() external {
        // Logic for burning DSC
    }

    function liquidate() external {
        // Logic for liquidating
    }

    function getHealthFactor() external view {
        // Logic for getting health factor
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

    ///////////////////////// Internal Functions ///////////////////////

    // 1, Check health factor. Do they have enough collateral
    // 2. Revert if health factor is broken
    function _revertIfHealthFactorIsBroken(address _user) internal view {
        uint256 userHealthFactor = _healthFactor(_user);
        if (userHealthFactor < MIN_HEALTH_FACTOR) {
            revert Errors.DSCEngine__HealthFactorTooLow(userHealthFactor);
        }
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
