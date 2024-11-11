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

/**
 * @title MinimalAccount
 * @author Arshil Hapani
 * @notice It is the minimal account abstraction contract which is used to execute user operations and it uses simple signature validation
 */
contract MinimalAccount is IAccount, Ownable {
    /**
     * @dev It is the entrypoint interface **(setup in the constructor)**
     */
    IEntryPoint private immutable i_entryPoint;

    /**
     * @dev It is used to setup the **entrypoint interface**
     * @param _entrypoint Address of the entrypoint contract in the network
     */
    constructor(address _entrypoint) Ownable(msg.sender) {
        i_entryPoint = IEntryPoint(_entrypoint);
    }

    /**
     *
     * @param userOp PackedUserOperation struct which follows eip 4337 standard
     * @param userOpHash The hash of the user operation struct which is used to validate the signature
     * @param missingAccountFunds Funds required to execute the user operation
     * @return validationData Returns the validation data which is used to validate the user operation `(0 -> success, 1 -> failed)`
     */
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

    /**
     *
     * @param _dest Address of the contract to call
     * @param _amount Amount to send to the contract
     * @param _funcData Encoded function data to call the contract
     */
    function execute(address _dest, uint256 _amount, bytes calldata _funcData) external onlyEntrypointOrOwner {
        (bool success, bytes memory data) = _dest.call{value: _amount}(_funcData);
        if (!success) {
            revert Errors.MinimumAccount__CallFailed(data);
        }
    }

    /**
     *
     * @param userOp User operation struct
     * @param userOpHash Hash of the user operation struct
     */
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

    /**
     * @dev It is used to validate the nonce of the user operation
     * @param missingAccountFunds Funds required to execute the user operation
     */
    function _payPreFund(uint256 missingAccountFunds) internal {
        if (missingAccountFunds != 0) {
            (bool success,) = msg.sender.call{value: missingAccountFunds, gas: type(uint256).max}("");
            (success);
        }
    }

    /**
     * Getters
     */

    /**
     * @dev It is used to get the entrypoint address
     */
    function getEntryPoint() external view returns (address) {
        return address(i_entryPoint);
    }

    /**
     * Modifiers
     */

    /**
     * @dev It is used to restrict the function to be called only by the entrypoint
     */
    modifier onlyEntrypoint() {
        if (msg.sender != address(i_entryPoint)) {
            revert Errors.MinimumAccount__RequireEntryPointToCallThisFunction();
        }
        _;
    }

    /**
     * @dev It is used to restrict the function to be called only by the entrypoint or owner
     */
    modifier onlyEntrypointOrOwner() {
        if (msg.sender != address(i_entryPoint) && msg.sender != owner()) {
            revert Errors.MinimumAccount__RequireEntryPointToCallThisFunction();
        }
        _;
    }

    /**
     * Receive and fallback functions
     */

    /**
     * @dev It is used to receive ether
     */
    receive() external payable {}

    /**
     * @dev It is used to receive ether
     */
    fallback() external payable {}
}
