//SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {IAccount} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/interfaces/IAccount.sol";
import {Transaction} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";

/**
  * Phase 1. Validation
		1 -> The user send the transaction to the "zkSync API Client" (sort of light node)
		2 -> The zkSync API Client checks to see that the nonce is unique by querying the nonceHolder system contract
  * Phase 2. Execute the transaction
*/
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
