// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {IAccount} from "lib/account-abstraction/contracts/interfaces/IAccount.sol";
import {PackedUserOperation} from "lib/account-abstraction/contracts/interfaces/PackedUserOperation.sol";
import {SIG_VALIDATION_FAILED, SIG_VALIDATION_SUCCESS} from "lib/account-abstraction/contracts/core/Helpers.sol";
import {IEntryPoint} from "lib/account-abstraction/contracts/interfaces/IEntryPoint.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

import {Errors} from "./utils/Errors.sol";

contract MinimalAccount is IAccount, Ownable {
    IEntryPoint private immutable i_entryPoint;

    constructor(address _entrypoint) Ownable(msg.sender) {
        i_entryPoint = IEntryPoint(_entrypoint);
    }

    function validateUserOp(PackedUserOperation calldata userOp, bytes32 userOpHash, uint256 missingAccountFunds)
        external
        override
        onlyEntrypoint
        returns (uint256 validationData)
    {
        validationData = _validateSignature(userOp, userOpHash);
        // _validateNonce(userOp.nonce);
        _payPreFund(missingAccountFunds);
    }

    function execute(address _dest, uint256 _amount, bytes calldata _funcData) external onlyEntrypointOrOwner {
        (bool success, bytes memory data) = _dest.call{value: _amount}(_funcData);
        if (!success) {
            revert Errors.MinimumAccount__CallFailed(data);
        }
    }

    function _validateSignature(PackedUserOperation calldata userOp, bytes32 userOpHash)
        internal
        view
        returns (uint256 validationData)
    {
        bytes32 ethSignedMessageHash = MessageHashUtils.toEthSignedMessageHash(userOpHash);
        address signer = ECDSA.recover(ethSignedMessageHash, userOp.signature);

        // custom logic for signature validation (e.g. whitelist, session key,etc.)
        if (signer != owner()) {
            return SIG_VALIDATION_FAILED;
        }
        return SIG_VALIDATION_SUCCESS;
    }

    function _payPreFund(uint256 missingAccountFunds) internal {
        if (missingAccountFunds != 0) {
            (bool success,) = msg.sender.call{value: missingAccountFunds, gas: type(uint256).max}("");
            (success);
        }
    }

    /**
     * Getters
     */
    function getEntryPoint() external view returns (address) {
        return address(i_entryPoint);
    }

    /**
     * Modifiers
     */
    modifier onlyEntrypoint() {
        if (msg.sender != address(i_entryPoint)) {
            revert Errors.MinimumAccount__RequireEntryPointToCallThisFunction();
        }
        _;
    }

    modifier onlyEntrypointOrOwner() {
        if (msg.sender != address(i_entryPoint) && msg.sender != owner()) {
            revert Errors.MinimumAccount__RequireEntryPointToCallThisFunction();
        }
        _;
    }

    /**
     * Receive and fallback functions
     */
    receive() external payable {}
    fallback() external payable {}
}
