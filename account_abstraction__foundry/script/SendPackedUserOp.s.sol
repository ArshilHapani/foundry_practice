// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";
import {PackedUserOperation} from "account-abstraction/interfaces/PackedUserOperation.sol";
import {IEntryPoint} from "account-abstraction/interfaces/IEntryPoint.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {MinimalAccount} from "src/ethereum/MinimalAccount.sol";
import {NetworkConfig, CodeConstants, HelperConfig} from "./HelperConfig.s.sol";

contract SendPackedUserOp is Script, CodeConstants {
    using MessageHashUtils for bytes32;

    function run() external {
        HelperConfig helperConfig = new HelperConfig();

        /*
            Polygon Amony config
        */
        address dest = 0x1ad9Af12d781503b461Cd5Bca8B41815966AB510; // polygon amony custom ERC20 token address
        address minimalAccountAddress = 0xbE4a707dAc78FA1Fb4DC589C996d6ed312308e32; // minimal account address in polygon amony

        /*
            Ethereum Sepolia config
        */
        // address dest = 0x50f1B17B9Bc392b02a628F361389025620Fc09f2; // ethereum sepolia ERC20 token address
        // address minimalAccountAddress = 0xf9daB4653CEB9F738d7480B8984DB6215A7D813A; // minimal account address in ethereum sepolia

        address toAllowance = 0xf9daB4653CEB9F738d7480B8984DB6215A7D813A; // core wallet address
        uint256 value = 0;
        uint256 allowance = 0.02 ether;
        bytes memory functionData = abi.encodePacked(IERC20.approve.selector, toAllowance, allowance);
        bytes memory executeCallData =
            abi.encodeWithSelector(MinimalAccount.execute.selector, dest, value, functionData);
        NetworkConfig memory config = helperConfig.getConfig();
        PackedUserOperation memory userOp = generateUserOperation(executeCallData, config, minimalAccountAddress);

        PackedUserOperation[] memory userOps = new PackedUserOperation[](1);
        userOps[0] = userOp;

        vm.startBroadcast();
        IEntryPoint(config.entryPoint).handleOps(userOps, payable(config.account));
        vm.stopBroadcast();
    }

    function generateUserOperation(bytes memory callData, NetworkConfig memory config, address sender)
        public
        view
        returns (PackedUserOperation memory)
    {
        /**
         * 1. Generate unsigned user operation
         */
        uint256 nonce = vm.getNonce(sender) - 1;
        PackedUserOperation memory userOps = _generateUnsignedUserOperation(callData, sender, nonce);

        // 2. get userOp hash
        bytes32 userOpHash = IEntryPoint(config.entryPoint).getUserOpHash(userOps);
        bytes32 digest = userOpHash.toEthSignedMessageHash();

        // 3. sign it
        uint8 v;
        bytes32 r;
        bytes32 s;
        if (block.chainid == 31337) {
            (v, r, s) = vm.sign(DEFAULT_PRIVATE_KEY_ANVIL, digest);
        } else {
            (v, r, s) = vm.sign(config.account, digest);
        }
        userOps.signature = abi.encodePacked(r, s, v);

        return userOps;
    }

    function _generateUnsignedUserOperation(bytes memory callData, address sender, uint256 nonce)
        internal
        pure
        returns (PackedUserOperation memory)
    {
        uint128 verificationGasLimit = 16777216;
        uint128 callGasLimit = verificationGasLimit;
        uint256 maxPriorityFeePerGas = 256;
        uint256 maxFeePerGas = maxPriorityFeePerGas;

        return PackedUserOperation({
            sender: sender,
            nonce: nonce,
            initCode: hex"",
            callData: callData,
            accountGasLimits: bytes32(uint256(verificationGasLimit) << 128 | callGasLimit),
            preVerificationGas: verificationGasLimit,
            gasFees: bytes32(uint256(maxPriorityFeePerGas) << 128 | maxFeePerGas),
            paymasterAndData: hex"",
            signature: hex""
        });
    }
}
