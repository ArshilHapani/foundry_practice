// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";

import {DSCEngine} from "src/DSCEngine.sol";
import {DecentralizedStableCoin} from "src/DecentralizedStableCoin.sol";

/**
 * @title Handler
 * @author Arshil Hapani
 * @notice This contract is used as targetContract in fuzzing
 */
contract Handler is Test {
    DSCEngine immutable dscEngine;
    DecentralizedStableCoin immutable dsc;
    ERC20Mock wEth;
    ERC20Mock wBtc;

    uint256 constant MAX_DEPOSIT_AMOUNT = type(uint104).max;

    constructor(DSCEngine dscEngine_, DecentralizedStableCoin dsc_) {
        dscEngine = dscEngine_;
        dsc = dsc_;

        address[] memory tokenAddresses = dscEngine.getCollateralTokens();
        wEth = ERC20Mock(tokenAddresses[0]);
        wBtc = ERC20Mock(tokenAddresses[1]);
    }

    function depositCollateral(uint256 collateralSeed_, uint256 amount_) public {
        // passed parameters are randomly generated
        ERC20Mock collateral = _getTokenFromSeed(collateralSeed_);
        uint256 boundedAmount = bound(amount_, 1, MAX_DEPOSIT_AMOUNT);

        vm.startPrank(msg.sender);
        collateral.mint(msg.sender, boundedAmount);
        collateral.approve(address(dscEngine), boundedAmount);
        dscEngine.depositCollateral(address(collateral), boundedAmount);
        vm.stopPrank();
    }

    function redeemCollateral(uint256 collateralSeed_, uint256 amount_) public {
        ERC20Mock collateral = _getTokenFromSeed(collateralSeed_);
        uint256 maxCollateralToRedeem = dscEngine.getCollateralBalanceOfUser(msg.sender, address(collateral));
        amount_ = bound(amount_, 0, maxCollateralToRedeem);
        if (amount_ <= 0) {
            return;
        }
        vm.prank(msg.sender);
        dscEngine.redeemCollateral(address(collateral), amount_);
    }

    function _getTokenFromSeed(uint256 seed_) internal view returns (ERC20Mock) {
        if (seed_ % 2 == 0) {
            return wEth;
        } else {
            return wBtc;
        }
    }
}
