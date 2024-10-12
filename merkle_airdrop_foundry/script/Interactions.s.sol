// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

import {MerkleAirdrop} from "src/MerkleAidrdop.sol";

contract ClaimAirdrop is Script {
    error __ClaimAirdropScript__InvalidSignatureLength();

    address constant CLAIM_ADDRESS = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    uint256 constant CLAIMING_AMOUNT = 25 ether;
    bytes32 PROOF1 = 0xd1445c931158119b00449ffcac3c947d028c0c359c34a6646d95962b3b55c6ad;
    bytes32 PROOF2 = 0xe5ebd1e1b5a5478a944ecab36a9a954ac3b6b8216875f6524caa7a1d87096576;
    bytes32[] proof = [PROOF1, PROOF2];
    bytes private constant SIGNATURE =
        hex"95c2de964f19cf64387aea722325372489d657047757553f69cf5663d1b288f15abd72033ae8668c6f34ad1325a09226ad7e699a75f4f09e515518412eadf5e91c";

    function run() external {
        address recentlyDeployedContract = DevOpsTools.get_most_recent_deployment("MerkleAirdrop", block.chainid);
        claimAirdrop(recentlyDeployedContract);
    }

    function claimAirdrop(address recentDeployedContract_) public {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(SIGNATURE);
        vm.startBroadcast();
        MerkleAirdrop merkleAirdrop = MerkleAirdrop(recentDeployedContract_);
        merkleAirdrop.claim(CLAIM_ADDRESS, CLAIMING_AMOUNT, proof, v, r, s);
        vm.stopBroadcast();
    }

    function splitSignature(bytes memory sig_) public pure returns (uint8 v, bytes32 r, bytes32 s) {
        if (sig_.length != 65) {
            revert __ClaimAirdropScript__InvalidSignatureLength();
        }

        assembly {
            r := mload(add(sig_, 32)) // skip the first 32 bytes (signature length)
            s := mload(add(sig_, 64)) // skip the first 64 bytes (signature length + r)
            v := byte(0, mload(add(sig_, 96))) // skip the first 96 bytes (signature length + r + s)
        }
    }
}
