// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {MerkleAirdrop} from "src/MerkleAidrdop.sol";
import {NexerToken} from "src/NexerToken.sol";

contract DeployMerkleAirdrop is Script {
    bytes32 public constant ROOT = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    uint256 public constant AMOUNT_TO_MINT = 25 ether * 4;

    function run() external returns (MerkleAirdrop, NexerToken) {
        return deployMerkleAirdrop();
    }

    function deployMerkleAirdrop() public returns (MerkleAirdrop, NexerToken) {
        vm.startBroadcast();
        NexerToken nexerToken = new NexerToken();
        MerkleAirdrop merkleAirdrop = new MerkleAirdrop(ROOT, address(nexerToken));
        nexerToken.mint(nexerToken.owner(), AMOUNT_TO_MINT);
        nexerToken.transfer(address(merkleAirdrop), AMOUNT_TO_MINT);
        vm.stopBroadcast();
        return (merkleAirdrop, nexerToken);
    }
}
