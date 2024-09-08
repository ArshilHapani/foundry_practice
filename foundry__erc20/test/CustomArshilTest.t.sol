// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";

import {DeployCustomToken} from "script/DeployCustomToken.s.sol";
import {CustomToken} from "src/CustomToken.sol";

contract CustomArshilTest is Test {
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    address nami = makeAddr("nami");
    CustomToken customToken;

    function setUp() external {
        // owner = msg.sender;
        DeployCustomToken deployCustomToken = new DeployCustomToken();
        customToken = deployCustomToken.deployCustomToken();

        // add customToken on bob's account
        vm.startPrank(msg.sender);
        customToken.transfer(bob, 20 ether);
        vm.stopPrank();
    }

    function testEveryThing() external {
        vm.prank(bob);
        customToken.approve(alice, 10 ether);

        uint256 balanceBefore = customToken.balanceOf(bob);
        vm.prank(bob);
        customToken.transfer(nami, 15 ether);

        uint256 balanceAfter = customToken.balanceOf(bob);

        vm.prank(alice);
        customToken.transferFrom(bob, alice, 2 ether);
        vm.prank(alice);
        customToken.transferFrom(bob, alice, 3 ether);

        assertEq(balanceBefore - 15 ether, balanceAfter);
    }
}
