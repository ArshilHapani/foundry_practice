//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {ZkSyncChainChecker} from "foundry-devops/src/ZkSyncChainChecker.sol";

import {MerkleAirdrop} from "src/MerkleAidrdop.sol";
import {NexerToken} from "src/NexerToken.sol";
import {DeployMerkleAirdrop} from "script/DeployMerkleAirdrop.s.sol";

contract MerkleAirdropTest is ZkSyncChainChecker, Test {
    uint256 constant AMOUNT_TO_CLAIM = 25 ether; // equivalent to 25 * 10e18
    uint256 constant TOTAL_AMOUNT_TO_MINT = AMOUNT_TO_CLAIM * 4;
    bytes32 public constant ROOT = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;

    bytes32 p1 = 0x0fd7c981d39bece61f7499702bf59b3114a90e66b51ba2c53abdf7b62986c00a;
    bytes32 p2 = 0xe5ebd1e1b5a5478a944ecab36a9a954ac3b6b8216875f6524caa7a1d87096576;
    bytes32[] public PROOF = [p1, p2];

    address user;
    address public gasPayer;
    uint256 userPrivKey;

    NexerToken nexerToken;
    MerkleAirdrop merkleAirdrop;

    function setUp() external {
        (user, userPrivKey) = makeAddrAndKey("user");
        gasPayer = makeAddr("gasPayer");
        if (!isZkSyncChain()) {
            DeployMerkleAirdrop deployMerkleAirdrop = new DeployMerkleAirdrop();
            (merkleAirdrop, nexerToken) = deployMerkleAirdrop.deployMerkleAirdrop();
        } else {
            nexerToken = new NexerToken();
            merkleAirdrop = new MerkleAirdrop(ROOT, address(nexerToken));
            nexerToken.mint(nexerToken.owner(), TOTAL_AMOUNT_TO_MINT);
            nexerToken.transfer(address(merkleAirdrop), TOTAL_AMOUNT_TO_MINT);
        }
    }

    function testUserCanClaim() public {
        uint256 startingBalance = nexerToken.balanceOf(user);
        bytes32 digest = merkleAirdrop.getMessageHash(user, AMOUNT_TO_CLAIM);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(userPrivKey, digest);

        vm.prank(gasPayer);
        merkleAirdrop.claim(user, AMOUNT_TO_CLAIM, PROOF, v, r, s);

        uint256 endingBalance = nexerToken.balanceOf(user);

        assertEq(endingBalance, startingBalance + AMOUNT_TO_CLAIM);
    }
}
