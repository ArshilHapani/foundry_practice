// SPDX-License-Identifier:MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";

import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address USER = makeAddr("robin");
    uint256 sendValue = 10 ether; // 10e18
    uint256 userBalance = 100 ether;

    uint256 private constant GAS_PRICE = 1;

    // `setUp` function runs before each test (just like beforeEach in mocha)
    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();

        vm.deal(USER, userBalance); // sets USER balance to 100 ether
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsSender() public view {
        // assertEq(fundMe.i_owner(), address(this));
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersion() public view {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testFundFunctionToBeReverted() public {
        vm.expectRevert(); // next line should revert ().to.be.reverted
        fundMe.fund();
    }

    function testUpdateDataStructuresOnFund() public {
        vm.prank(USER); // pretend to be USER ().connect(signer)
        fundMe.fund{value: sendValue}();
        assertEq(fundMe.getAddressToAmountFunded(USER), 10e18);
        assertEq(fundMe.getFunder(0), USER);
    }

    function testOnlyOwnerCanWithdraw() public fundMeModifier {
        vm.prank(USER);
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testWithdrawWithSingleFunder() public fundMeModifier {
        uint256 balanceBefore = fundMe.getOwner().balance;
        uint256 fundMeStartingBalance = address(fundMe).balance;

        vm.txGasPrice(GAS_PRICE);
        vm.prank(fundMe.getOwner());
        fundMe.withdraw();

        uint256 balanceAfter = fundMe.getOwner().balance;
        uint256 fundMeEndingBalance = address(fundMe).balance;

        assertEq(balanceAfter - balanceBefore, fundMeStartingBalance);
        assertEq(fundMeEndingBalance, 0);
    }

    function testWithdrawWithMultipleFunder() public fundMeModifier {
        uint160 numberOfFunders = 10;
        uint160 startingFunderIndex = 1;

        for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
            hoax(address(i), sendValue);
            fundMe.fund{value: sendValue}();
        }

        uint256 startingOwnerBalance = fundMe.getOwner().balance;
        uint256 startingFundMeBalance = address(fundMe).balance;

        // uint256 remainingGas = gasleft();
        vm.startPrank(fundMe.getOwner());
        // In between is performed by `fundMe.getOwner()` address
        fundMe.cheapWithdraw();
        vm.stopPrank();

        //  uint256 gasUsed = remainingGas - gasleft() * tx.gasprice;
        // console.log(gasUsed);

        assert(address(fundMe).balance == 0);
        assert(
            fundMe.getOwner().balance - startingOwnerBalance ==
                startingFundMeBalance
        );
    }

    modifier fundMeModifier() {
        vm.prank(USER);
        fundMe.fund{value: sendValue}();
        _;
    }
}
