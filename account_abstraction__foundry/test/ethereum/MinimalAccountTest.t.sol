// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

import {MinimalAccount} from "src/ethereum/MinimalAccount.sol";
import {Errors} from "src/ethereum/utils/Errors.sol";
import {DeployMinimalAccount} from "script/DeployMinimalAccount.s.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract MinimalAccountTest is Test {
    HelperConfig helperConfig;
    MinimalAccount minimalAccount;
    ERC20Mock usdc;

    uint256 constant AMOUNT = 1 ether;

    address randomUser = makeAddr("randomUser");

    function setUp() external {
        DeployMinimalAccount deployMinimalAccount = new DeployMinimalAccount();
        (helperConfig, minimalAccount) = deployMinimalAccount.deployMinimalAccount();
        usdc = new ERC20Mock();
    }

    // msg.sender -> MinimalAccount
    function testOwnerCanExecuteCommands() public {
        // arrange
        assertEq(usdc.balanceOf(address(minimalAccount)), 0);
        address dest = address(usdc);
        uint256 value = 0;
        bytes memory functionData = abi.encodeWithSelector(ERC20Mock.mint.selector, address(minimalAccount), AMOUNT);

        // act
        vm.prank(minimalAccount.owner());
        minimalAccount.execute(dest, value, functionData);

        // assert
        assertEq(usdc.balanceOf(address(minimalAccount)), AMOUNT);
    }

    function testNonOwnerCannotExecuteCommands() public {
        // arrange
        assertEq(usdc.balanceOf(address(minimalAccount)), 0);
        address dest = address(usdc);
        uint256 value = 0;
        bytes memory functionData = abi.encodeWithSelector(ERC20Mock.mint.selector, address(minimalAccount), AMOUNT);

        // act
        vm.prank(randomUser);
        vm.expectRevert(Errors.MinimumAccount__RequireEntryPointToCallThisFunction.selector);
        minimalAccount.execute(dest, value, functionData);

        // assert
        assertEq(usdc.balanceOf(address(minimalAccount)), 0);
    }
}
