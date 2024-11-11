// SPDX-License-Identifier:MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";

import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionTest is Test {
    FundMe fundMe;
    address USER = makeAddr("robin");
    uint256 sendValue = 1 ether;
    uint256 userBalance = 100 ether;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, userBalance);
    }

    function testUserCanFundInteraction() public {
        FundFundMe ffm = new FundFundMe();
        ffm.fundFundMe(address(fundMe));

        WithdrawFundMe wfm = new WithdrawFundMe();
        wfm.withDrawFundMe(address(fundMe));

        assertEq(fundMe.getOwner().balance, 0);
    }
}
