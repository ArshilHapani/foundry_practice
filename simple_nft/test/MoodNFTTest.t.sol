// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";

import {MoodNFT} from "src/MoodNFT.sol";
import {DeployMoodNFT} from "script/DeployMoodNFT.s.sol";

contract MoodNFTTest is Test {
    MoodNFT moodNft;
    address USER = makeAddr("Nami");

    function setUp() external {
        DeployMoodNFT deployMoodNFT = new DeployMoodNFT();
        moodNft = deployMoodNFT.deployMoodNFT();
    }

    function testWhetherItMintsNFT() public {
        vm.prank(USER);
        moodNft.mintNFT();

        assertEq(moodNft.balanceOf(USER), 1);
        assertEq(moodNft.ownerOf(1), USER);
    }

    function testWhetherIfFlipsMood() public {
        vm.prank(USER);
        moodNft.mintNFT();

        MoodNFT.Mood prevMood = moodNft.getMood(1);
        vm.prank(USER);
        moodNft.flipMood(1);
        MoodNFT.Mood newMood = moodNft.getMood(1);

        assert(prevMood == MoodNFT.Mood.HAPPY);
        assert(newMood == MoodNFT.Mood.SAD);
    }
}
