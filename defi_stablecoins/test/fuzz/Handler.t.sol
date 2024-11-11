// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {DSCEngine} from "src/DSCEngine.sol";
import {DecentralizedStableCoin} from "src/DecentralizedStableCoin.sol";
import {MockV3Aggregator} from "test/Mock/MockV3Aggregator.sol";

/**
 * @title Handler
 * @author Arshil Hapani
 * @notice This contract is used as targetContract in fuzzing
 */
contract Handler is Test {
    using EnumerableSet for EnumerableSet.AddressSet;

    DSCEngine immutable dscEngine;
    DecentralizedStableCoin immutable dsc;
    ERC20Mock wEth;
    ERC20Mock wBtc;
    EnumerableSet.AddressSet private usersWithCollateralDeposited;

    uint256 constant MAX_DEPOSIT_AMOUNT = type(uint104).max;
    uint256 public timeMintIsCalled;
    MockV3Aggregator public wEthPriceFeed;
    MockV3Aggregator public wBtcPriceFeed;

    constructor(DSCEngine dscEngine_, DecentralizedStableCoin dsc_) {
        dscEngine = dscEngine_;
        dsc = dsc_;

        address[] memory tokenAddresses = dscEngine.getCollateralTokens();
        wEth = ERC20Mock(tokenAddresses[0]);
        wBtc = ERC20Mock(tokenAddresses[1]);

        wEthPriceFeed = MockV3Aggregator(dscEngine.getCollateralTokenPriceFeed(address(wEth)));
        wBtcPriceFeed = MockV3Aggregator(dscEngine.getCollateralTokenPriceFeed(address(wBtc)));
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
        usersWithCollateralDeposited.add(msg.sender);
    }

    function mintDSC(uint256 amountToMint_, uint256 addressSeed_) public {
        if (usersWithCollateralDeposited.length() == 0) return;
        address user = usersWithCollateralDeposited.at(addressSeed_ % usersWithCollateralDeposited.length());
        (uint256 totalDSCMinted, uint256 totalCollateralValue) = dscEngine.getAccountInformation(user);
        int256 maxDscToMint = int256((totalCollateralValue / 2) - totalDSCMinted);
        if (maxDscToMint < 0) {
            return;
        }
        amountToMint_ = bound(amountToMint_, 1, uint256(maxDscToMint));

        vm.startPrank(user);
        dscEngine.mintDsc(amountToMint_);
        vm.stopPrank();
        timeMintIsCalled++;
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

    // function updateCollateralPrice(uint96 wEtcPriceSeed_) public {
    //     int256 wEthNewPriceFeed = int256(uint256(wEtcPriceSeed_));
    //     wEthPriceFeed.updateAnswer(wEthNewPriceFeed);
    // }

    function _getTokenFromSeed(uint256 seed_) internal view returns (ERC20Mock) {
        if (seed_ % 2 == 0) {
            return wEth;
        } else {
            return wBtc;
        }
    }
}
