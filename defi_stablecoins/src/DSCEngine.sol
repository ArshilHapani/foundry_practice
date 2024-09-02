//SPDX-License-Identifier:MIT

pragma solidity 0.8.24;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

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
    DecentralizedStableCoin private immutable i_decentralizedStableCoin;

    mapping(address tokens => address priceFeeds) private s_priceFeeds;
    mapping(address user => mapping(address token => uint256 collateral)) private s_collateralDeposited;

    constructor(address[] memory _tokenAddresses, address[] memory _priceFeedAddresses, address _dscAddress) {
        if (_tokenAddresses.length != _priceFeedAddresses.length) {
            revert Errors.DSCEngine__ArrayLengthMismatch();
        }

        for (uint256 i = 0; i < _tokenAddresses.length; i++) {
            s_priceFeeds[_tokenAddresses[i]] = _priceFeedAddresses[i];
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

    function mintDsc() external {
        // Logic for minting DSC
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
