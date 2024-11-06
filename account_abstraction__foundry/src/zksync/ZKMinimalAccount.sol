//SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {
    IAccount,
    ACCOUNT_VALIDATION_SUCCESS_MAGIC
} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/interfaces/IAccount.sol";
import {
    Transaction,
    MemoryTransactionHelper
} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";
import {SystemContractsCaller} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/SystemContractsCaller.sol";
import {
    NONCE_HOLDER_SYSTEM_CONTRACT,
    BOOTLOADER_FORMAL_ADDRESS
} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/Constants.sol";
import {INonceHolder} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/interfaces/INonceHolder.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {Errors} from "./Errors.sol";

/**
 * @title ZKMinimalAccount
 * @author Arshil Hapani
 * @notice Here are the steps to validate and execute the transaction
 *
 * in type 113 transaction the `msg.sender` is always `bootloader`
 *
 * * Phase 1. Validation
 *  * 1 -> The user send the transaction to the "zkSync API Client" (sort of light node)
 *  * 2 -> The zkSync API Client checks to see that the nonce is unique by querying the nonceHolder system contract
 *  * 3 -> The zkSync API client calls validateTransaction(), which MUST update the `nonce`
 *  * 4 -> The zkSync API client checks the nonce is updated
 *  * 5 -> The zkSync API client calls payForTransaction(), or prepareForPaymaster() & validateAndPayForPayMasterTransaction()
 *  * 6 -> The zkSync API client verifies that the bootloader gets paid
 * ***
 * * Phase 2. Execute the transaction
 *
 * * 1 -> The zkSync API client passes the validated transaction to the main node / sequencer (as of today, they are the same)
 * * 2 -> The main node call `executeTransaction()`
 * * 3 -> If a paymaster was used, the `postTransaction()` is called
 *
 */
contract ZKMinimalAccount is IAccount, Ownable {
    using MemoryTransactionHelper for Transaction;
    using MessageHashUtils for bytes32;

    constructor() Ownable(msg.sender) {}

    //////////////////////////////////
    ///////Externam functions/////////
    //////////////////////////////////

    /**
     * @notice it must increment the nonce
     * @notice it must validate the transaction (check the owner has signed the transaction)
     * @notice check that we have enough balance to pay for the transaction
     */
    function validateTransaction(
        bytes32, /* _txHash */
        bytes32, /* _suggestedSignedHash */
        Transaction memory _transaction
    ) external payable requireBootLoader returns (bytes4 magic) {
        // call nonceholder system contract
        // incrementing the nonce by calling the system contract
        SystemContractsCaller.systemCallWithPropagatedRevert(
            uint32(gasleft()),
            address(NONCE_HOLDER_SYSTEM_CONTRACT),
            0,
            abi.encodeCall(INonceHolder.incrementMinNonceIfEquals, _transaction.nonce)
        );

        // check for fee to pay
        uint256 feesToPay = _transaction.totalRequiredBalance();
        if (feesToPay > address(this).balance) {
            revert Errors.ZKMinimalAccount__InsufficientBalance();
        }

        // verify the signature
        bytes32 transactionHash = _transaction.encodeHash();
        bytes32 signedTxHash = transactionHash.toEthSignedMessageHash();
        address signer = ECDSA.recover(signedTxHash, _transaction.signature);
        bool isValid = signer == owner();

        // return the "magic" number
        if (isValid) {
            magic = ACCOUNT_VALIDATION_SUCCESS_MAGIC;
        } else {
            magic = bytes4(0);
        }
    }

    function executeTransaction(bytes32 _txHash, bytes32 _suggestedSignedHash, Transaction memory _transaction)
        external
        payable
    {}

    function executeTransactionFromOutside(Transaction memory _transaction) external payable {}

    function payForTransaction(bytes32 _txHash, bytes32 _suggestedSignedHash, Transaction memory _transaction)
        external
        payable
    {}

    function prepareForPaymaster(bytes32 _txHash, bytes32 _possibleSignedHash, Transaction memory _transaction)
        external
        payable
    {}

    //////////////////////////////////
    ///////Internal functions/////////
    //////////////////////////////////

    //////////////////////////////////
    ////////////Modifiers/////////////
    //////////////////////////////////

    modifier requireBootLoader() {
        if (msg.sender != BOOTLOADER_FORMAL_ADDRESS) {
            revert Errors.ZKMinimalAccount__TransactionRequestIsNotFromBootLoader();
        }
        _;
    }
}
