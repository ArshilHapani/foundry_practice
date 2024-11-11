// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";

import {DeployLottery} from "script/DeployLottery.s.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {Lottery} from "src/Lottery.sol";
import {Errors as LotteryErrors} from "src/utils/Errors.sol";
import {Events as LotteryEvents} from "src/utils/Events.sol";

contract LotteryTest is Test {
    Lottery public lottery;
    HelperConfig public helperConfig;
    HelperConfig.NetworkConfig public networkConfig;

    address public PLAYER = makeAddr("Player");
    uint256 public constant PLAYER_INITIAL_BALANCE =
        1000 ether; /** Bahot paisa hai mere pass... */

    function setUp() external {
        DeployLottery deployer = new DeployLottery();
        (lottery, helperConfig) = deployer.deployContract();
        networkConfig = helperConfig.getConfig();
        vm.deal(PLAYER, PLAYER_INITIAL_BALANCE);
    }

    function testLotteryInitialStateAsOpen() public view {
        assert(lottery.getLotteryState() == Lottery.LotteryState.OPEN);
    }

    // Enter lottery tests
    function testEnterLotteryFeeRevert() public prank {
        vm.expectRevert(LotteryErrors.Lottery__NotEnoughEntranceFee.selector); // equivalent to .to.be.revertedWithCustomError(<name>)
        lottery.enterLottery();
    }

    function testWhetherPlayerEntersIntoArray() public prank {
        lottery.enterLottery{value: networkConfig.entranceFee}();
        address playerAfter = lottery.getPlayers()[0];
        assert(playerAfter == PLAYER);
    }

    function testEmitOfEventWhenPlayerEnters() public prank {
        vm.expectEmit(true, false, false, false, address(lottery)); // indexed parameters for first third and fourth one is for non indexed parameter
        emit LotteryEvents.Lottery__PlayerEntered(PLAYER);
        lottery.enterLottery{value: networkConfig.entranceFee}();
    }

    function testLotteryProhibitsEntranceWhenCalculating() public prank {
        lottery.enterLottery{value: networkConfig.entranceFee}();

        vm.warp(block.timestamp + networkConfig.interval + 1);
        vm.roll(block.number + 1);
        lottery.performUpkeep("");
        vm.expectRevert(LotteryErrors.Lottery__LotteryNotOpen.selector);

        vm.prank(PLAYER);
        lottery.enterLottery{value: networkConfig.entranceFee}();
    }

    // Check upKeep
    function testWhetherCheckUpkeepHasBalance() public {
        vm.warp(block.timestamp + networkConfig.interval + 1);
        vm.roll(block.number + 1);
        (bool upKeepNeeded, ) = lottery.checkUpkeep("");
        assert(!upKeepNeeded);
    }

    function testWhetherCheckUpKeepReturnsFalseIfLotteryIsNotOpen()
        public
        prank
        moveToFuture
    {
        lottery.performUpkeep("");

        (bool upKeepNeeded, ) = lottery.checkUpkeep("");
        assert(!upKeepNeeded);
    }

    function testPerformUpKeepOnlyRunsIfCheckUpKeepIsTrue()
        public
        prank
        moveToFuture
    {
        lottery.performUpkeep("");
    }

    function testPerformUpKeepRevertsIfCheckUpKeepFails() public prank {
        uint256 currentBalance = 0;
        uint256 numPlayers = 0;
        Lottery.LotteryState lotteryState = lottery.getLotteryState();

        lottery.enterLottery{value: networkConfig.entranceFee}();
        currentBalance = currentBalance + networkConfig.entranceFee;
        numPlayers = 1;

        vm.expectRevert(
            abi.encodeWithSelector(
                LotteryErrors.Lottery__UpkeepNotNeeded.selector,
                currentBalance,
                numPlayers,
                lotteryState
            )
        );
        lottery.performUpkeep("");
    }

    function testPerformUpKeepUpdatesLotteryStateAndEmitsEvent()
        public
        prank
        moveToFuture
    {
        // recording blockchain logs
        vm.recordLogs(); // keep track of logs which are emitted by `performUpkeep` function
        lottery.performUpkeep("");

        Vm.Log[] memory logs = vm.getRecordedLogs();
        bytes32 requestId = logs[1].topics[1];

        assert(uint256(requestId) > 0);
        assert(lottery.getLotteryState() == Lottery.LotteryState.CALCULATING);
    }

    // fulfillRandomWords
    function testFullFillRandomWordsCanOnlyBeCalledAfterPerformUpKeep(
        // fuzz testing can be configured in foundry.toml file
        uint256 _randomRequestId // foundry implicitly runs fuzz test with random values if we specify the parameters
    ) public prank moveToFuture {
        vm.expectRevert(VRFCoordinatorV2_5Mock.InvalidRequest.selector);
        VRFCoordinatorV2_5Mock(networkConfig.vrfCoordinator).fulfillRandomWords(
                _randomRequestId,
                address(lottery)
            );
    }

    function testFullFillRandomWordsPickAWinnerSendsMoney()
        public
        prank
        moveToFuture
    {
        // arrange
        uint256 additionalEntrance = 4; // 5 total player
        uint256 startingIndex = 1;
        address expectedWinner = address(1);
        for (
            uint256 i = startingIndex;
            i < startingIndex + additionalEntrance;
            i++
        ) {
            address newPlayer = address(uint160(i));
            hoax(newPlayer, 2 ether);
            lottery.enterLottery{value: networkConfig.entranceFee}();
        }

        uint256 startingTimeStamp = lottery.getLastTimeStamp();
        uint256 winnerStartingBalance = expectedWinner.balance;

        // act
        vm.recordLogs();
        lottery.performUpkeep("");
        Vm.Log[] memory logs = vm.getRecordedLogs();
        bytes32 requestId = logs[1].topics[1];

        VRFCoordinatorV2_5Mock(networkConfig.vrfCoordinator).fulfillRandomWords(
                uint256(requestId),
                address(lottery)
            );

        // assert
        address winner = lottery.getRecentWinner();
        Lottery.LotteryState lotteryState = lottery.getLotteryState();
        uint256 winnerBalance = winner.balance;
        uint256 endingTimeStamp = lottery.getLastTimeStamp();
        uint256 prize = networkConfig.entranceFee * (additionalEntrance + 1);

        assert(lotteryState == Lottery.LotteryState.OPEN);
        assert(winner == expectedWinner);
        assert(winnerBalance == winnerStartingBalance + prize);
        assert(endingTimeStamp > startingTimeStamp);
    }

    modifier prank() {
        vm.prank(PLAYER);
        _;
    }
    modifier moveToFuture() {
        lottery.enterLottery{value: networkConfig.entranceFee}();
        vm.warp(block.timestamp + networkConfig.interval + 1);
        vm.roll(block.number + 1);
        _;
    }
}
