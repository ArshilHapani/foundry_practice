//SPDX-License-Identifier:MIT
pragma solidity 0.8.24;

// write the tests
import {Test} from "forge-std/Test.sol";

import {CustomToken} from "src/CustomToken.sol";
import {DeployCustomToken} from "script/DeployCustomToken.s.sol";

contract CustomTokenTest is Test {
    CustomToken customToken;
    DeployCustomToken deployCustomToken;

    uint256 public constant INITIAL_SUPPLY = 10000000_000000000000000000;
    uint256 public constant STARTING_BALANCE = 20 ether;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    function setUp() public {
        deployCustomToken = new DeployCustomToken();
        customToken = deployCustomToken.deployCustomToken();

        vm.prank(msg.sender);
        customToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobHasStartingBalance() public view {
        assertEq(customToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowance() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend token on her behalf
        vm.prank(bob);
        customToken.approve(alice, initialAllowance);

        uint256 transferAmount = 1000;

        vm.prank(alice);
        customToken.transferFrom(bob, alice, transferAmount);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);
    }

    function testTransferFrom() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend token on her behalf
        vm.prank(bob);
        customToken.approve(alice, initialAllowance);

        uint256 transferAmount = 1000;

        vm.prank(alice);
        customToken.transferFrom(bob, alice, transferAmount);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);
    }

    function testTransfer() public {
        uint256 transferAmount = 1000;

        vm.prank(bob);
        customToken.transfer(alice, transferAmount);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);
    }

    function testTransferFromFail() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend token on her behalf
        vm.prank(bob);
        customToken.approve(alice, initialAllowance);

        uint256 transferAmount = 1000;

        vm.prank(alice);
        customToken.transferFrom(bob, alice, transferAmount);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);

        // Alice tries to transfer more than she has
        uint256 transferAmountFail = 2000;
        vm.prank(alice);
        vm.expectRevert();
        customToken.transferFrom(bob, alice, transferAmountFail);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);
    }

    function testTransferFail() public {
        uint256 transferAmount = 1000;

        vm.prank(bob);
        customToken.transfer(alice, transferAmount);
        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);

        // Alice tries to transfer more than she has
        uint256 transferAmountFail = 2000;
        vm.prank(alice);
        vm.expectRevert();
        customToken.transfer(bob, transferAmountFail);

        assertEq(customToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(customToken.balanceOf(alice), transferAmount);
    }
}
