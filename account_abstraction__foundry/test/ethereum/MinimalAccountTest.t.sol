// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {PackedUserOperation} from "account-abstraction/interfaces/PackedUserOperation.sol";
import {IEntryPoint} from "account-abstraction/interfaces/IEntryPoint.sol";

import {MinimalAccount} from "src/ethereum/MinimalAccount.sol";
import {Errors} from "src/ethereum/utils/Errors.sol";
import {DeployMinimalAccount} from "script/DeployMinimalAccount.s.sol";
import {HelperConfig, NetworkConfig} from "script/HelperConfig.s.sol";
import {SendPackedUserOp} from "script/SendPackedUserOp.s.sol";

contract MinimalAccountTest is Test {
    using MessageHashUtils for bytes32;

    HelperConfig helperConfig;
    MinimalAccount minimalAccount;
    ERC20Mock usdc;
    NetworkConfig networkConfig;
    SendPackedUserOp sendPackedUserOp;

    uint256 constant AMOUNT = 1 ether;

    address randomUser = makeAddr("randomUser");

    function setUp() external {
        DeployMinimalAccount deployMinimalAccount = new DeployMinimalAccount();
        (helperConfig, minimalAccount) = deployMinimalAccount.deployMinimalAccount();
        usdc = new ERC20Mock();
        networkConfig = helperConfig.getConfig();
        sendPackedUserOp = new SendPackedUserOp();
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

        // act & assert
        vm.prank(randomUser);
        vm.expectRevert(Errors.MinimumAccount__RequireEntryPointToCallThisFunction.selector);
        minimalAccount.execute(dest, value, functionData);

        // assert
        assertEq(usdc.balanceOf(address(minimalAccount)), 0);
    }

    function testRecoverSignedOp() public view {
        // arrange
        assertEq(usdc.balanceOf(address(minimalAccount)), 0);
        uint256 value = 0;
        address dest = address(usdc);

        bytes memory functionData = abi.encodeWithSelector(ERC20Mock.mint.selector, address(minimalAccount), AMOUNT);

        bytes memory executeCallData =
            abi.encodeWithSelector(MinimalAccount.execute.selector, dest, value, functionData);

        PackedUserOperation memory packedUserOperation =
            sendPackedUserOp.generateUserOperation(executeCallData, networkConfig);

        // act
        bytes32 userOperationHash = IEntryPoint(networkConfig.entryPoint).getUserOpHash(packedUserOperation);
        address owner = ECDSA.recover(userOperationHash.toEthSignedMessageHash(), packedUserOperation.signature);

        // assert
        assertEq(owner, minimalAccount.owner());
    }

    function testValidationOfUserOps() public {}
}
