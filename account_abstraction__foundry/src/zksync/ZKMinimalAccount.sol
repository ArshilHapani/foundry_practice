//SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {IAccount} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/interfaces/IAccount.sol";
import {Transaction} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";

contract ZKMinimalAccount is IAccount {
    function validateTransaction(bytes32 _txHash, bytes32 _suggestedSignedHash, Transaction memory _transaction)
        external
        payable
        returns (bytes4 magic)
    {}

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
}
