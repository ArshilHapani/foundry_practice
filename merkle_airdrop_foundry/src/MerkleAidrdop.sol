// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {IERC20, SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

import {Errors} from "./utils/Errors.sol";
import {Events} from "./utils/Events.sol";

contract MerkleAirdrop is EIP712 {
    /**
     * List of addresses
     * Allow someone in the list to claim token
     */
    using SafeERC20 for IERC20;

    bytes32 private constant MESSAGE_TYPEHASH = keccak256("AirdropClaim(address claimer,uint256 amount)");

    IERC20 private immutable i_token;

    struct AirdropClaim {
        address claimer;
        uint256 amount;
    }

    bytes32 private immutable i_merkleRoot;
    mapping(address claimer => bool hasClaimed) s_hasClaimed;

    constructor(bytes32 merkleRoot_, address token_) EIP712("MerkleAirdrop", "1") {
        i_merkleRoot = merkleRoot_;
        i_token = IERC20(token_);
    }

    function claim(address claimer_, uint256 amount_, bytes32[] calldata merkleProof_, uint8 v_, bytes32 r_, bytes32 s_)
        external
    {
        bytes32 message = getMessageHash(claimer_, amount_);
        if (!_isValidSignature(claimer_, message, v_, r_, s_)) {
            revert Errors.MerkleAirdrop__InvalidSignature();
        }
        if (s_hasClaimed[claimer_]) {
            revert Errors.MerkleAirdrop__AlreadyClaimed();
        }

        bytes32 leaf = keccak256(bytes.concat(keccak256(abi.encode(claimer_, amount_)))); // to avoid collision where two inputs have the same hash (second preimage attack)

        if (!MerkleProof.verify(merkleProof_, i_merkleRoot, leaf)) {
            revert Errors.MerkleAirdrop__InvalidProof();
        }
        s_hasClaimed[claimer_] = true;
        emit Events.Claimed(claimer_, amount_);
        i_token.safeTransfer(claimer_, amount_);
    }

    function _isValidSignature(address account_, bytes32 message_, uint8 v_, bytes32 r_, bytes32 s_)
        internal
        pure
        returns (bool)
    {
        (address actualSigner,,) = ECDSA.tryRecover(message_, v_, r_, s_);
        return actualSigner == account_;
    }

    function getMessageHash(address account_, uint256 amount_) public view returns (bytes32) {
        return _hashTypedDataV4(keccak256(abi.encode(MESSAGE_TYPEHASH, AirdropClaim(account_, amount_))));
    }

    function getMerkleRoot() external view returns (bytes32) {
        return i_merkleRoot;
    }

    function getAirdropToken() external view returns (IERC20) {
        return i_token;
    }
}
