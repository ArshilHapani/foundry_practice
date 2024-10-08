// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {IERC20, SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

import {Errors} from "./utils/Errors.sol";
import {Events} from "./utils/Events.sol";

contract MerkleAirdrop {
    /**
     * List of addresses
     * Allow someone in the list to claim token
     */
    using SafeERC20 for IERC20;

    bytes32 private immutable i_merkleRoot;
    IERC20 private immutable i_token;

    constructor(bytes32 merkleRoot_, address token_) {
        i_merkleRoot = merkleRoot_;
        i_token = IERC20(token_);
    }

    function claim(address claimer_, uint256 amount_, bytes32[] calldata merkleProof_) external {
        bytes32 leaf = keccak256(bytes.concat(keccak256(abi.encode(claimer_, amount_)))); // to avoid collision where two inputs have the same hash (second preimage attack)

        if (!MerkleProof.verify(merkleProof_, i_merkleRoot, leaf)) {
            revert Errors.MerkleAirdrop__InvalidProof();
        }

        emit Events.Claimed(claimer_, amount_);
        i_token.safeTransfer(claimer_, amount_);
    }
}
