// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";
import {PackedUserOperation} from "account-abstraction/interfaces/PackedUserOperation.sol";
import {IEntryPoint} from "account-abstraction/interfaces/IEntryPoint.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

import {NetworkConfig, CodeConstants} from "./HelperConfig.s.sol";

contract SendPackedUserOp is Script, CodeConstants {
    using MessageHashUtils for bytes32;

    function run() external {}

    function generateUserOperation(bytes memory callData, NetworkConfig calldata config, address sender)
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
