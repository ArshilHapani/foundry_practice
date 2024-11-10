// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

library Errors {
    error ZKMinimalAccount__InsufficientBalance();
    error ZKMinimalAccount__TransactionRequestIsNotFromBootLoader();
    error ZKMinimalAccount__TransactionRequestIsNotFromBootLoaderOrOwner();
    error ZKMinimalAccount__TransactionExecutionFailed();
    error ZKMinimalAccount__TransactionPaymentFailed();
    error ZKMinimalAccount__TransactionValidationFailed();
}
