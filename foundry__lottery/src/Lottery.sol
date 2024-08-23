// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";
import {AutomationCompatibleInterface} from "@chainlink/contracts/src/v0.8/automation/AutomationCompatible.sol";

import {Errors} from "./utils/Errors.sol";
import {Events} from "./utils/Events.sol";

contract Lottery is VRFConsumerBaseV2Plus {
    /** Type declarations */
    enum LotteryState {
        OPEN,
        CALCULATING
    }

    /** Constants */
    uint16 private constant REQUEST_CONFIRMATIONS = 2;
    uint32 private constant NUM_OF_WORDS = 1;

    /** Immutable variables */
    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    bytes32 private immutable i_keyHash;
    uint256 private immutable i_subscriptionId;
    uint32 private immutable i_callbackGasLimit;

    /** State variables */
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;
    address private s_recentWinner;
    LotteryState private s_lotteryState;

    constructor(
        uint256 _entranceFee,
        uint256 _interval,
        address _vrfCoordinator,
        bytes32 _keyHash,
        uint256 _subId,
        uint32 _callbackGasLimit
    ) VRFConsumerBaseV2Plus(_vrfCoordinator) {
        i_entranceFee = _entranceFee;
        i_interval = _interval;
        i_keyHash = _keyHash;
        i_subscriptionId = _subId;
        i_callbackGasLimit = _callbackGasLimit;

        s_lastTimeStamp = block.timestamp;
        s_lotteryState = LotteryState.OPEN;
    }

    function enterLottery() external payable {
        // require(msg.value >= i_entranceFee,Lottery__NotEnoughEntranceFee()); // for 0.8.26
        if (msg.value < i_entranceFee) {
            revert Errors.Lottery__NotEnoughEntranceFee();
        }
        if (s_lotteryState != LotteryState.OPEN) {
            revert Errors.Lottery__LotteryNotOpen();
        }
        s_players.push(payable(msg.sender));
        emit Events.Lottery__PlayerEntered(msg.sender);
    }

    function checkUpkeep(
        bytes memory /* checkData */
    ) public view returns (bool upkeepNeeded, bytes memory /* performData */) {
        bool hasTimePassed = ((block.timestamp - s_lastTimeStamp) >=
            i_interval);
        bool isOpen = s_lotteryState == LotteryState.OPEN;
        bool hasBalance = address(this).balance > 0;
        bool hasPlayers = s_players.length > 0;
        upkeepNeeded = hasTimePassed && isOpen && hasBalance && hasPlayers;
        return (upkeepNeeded, hex"");
    }

    function performUpkeep(bytes calldata /* performData */) external {
        (bool upkeepNeeded, ) = checkUpkeep(hex"");
        if (!upkeepNeeded) {
            revert Errors.Lottery__UpkeepNotNeeded(
                address(this).balance,
                s_players.length,
                uint256(s_lotteryState)
            );
        }

        s_lotteryState = LotteryState.CALCULATING;

        uint256 requestID = s_vrfCoordinator.requestRandomWords(
            VRFV2PlusClient.RandomWordsRequest({
                keyHash: i_keyHash,
                subId: i_subscriptionId,
                requestConfirmations: REQUEST_CONFIRMATIONS,
                callbackGasLimit: i_callbackGasLimit,
                numWords: NUM_OF_WORDS,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    VRFV2PlusClient.ExtraArgsV1({nativePayment: false})
                ) // new parameter
            })
        );

        emit Events.Lottery__RequestedRandomWinner(requestID);
    }

    // CEI -> Checks, Effects and Interactions
    function fulfillRandomWords(
        uint256 /*requestId */,
        uint256[] calldata randomWords
    ) internal override {
        // Checks (reverts conditions etc...)

        uint256 randomWinnerIndex = randomWords[0] % s_players.length;
        address payable winnerAddress = s_players[randomWinnerIndex];

        // Effects (Changes in the contract internal states)
        s_recentWinner = winnerAddress;
        s_lotteryState = LotteryState.OPEN;
        s_players = new address payable[](0);
        s_lastTimeStamp = block.timestamp;
        emit Events.Lottery__WinnerPicked(winnerAddress);

        // Interactions (external interactions with contract)
        (bool success, ) = winnerAddress.call{value: address(this).balance}("");
        if (!success) {
            revert Errors.Lottery__FailedToTransferFundToWinner();
        }
    }

    //** Getters */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }

    function getLotteryState() external view returns (LotteryState) {
        return s_lotteryState;
    }

    function getPlayers() external view returns (address payable[] memory) {
        return s_players;
    }

    function getLastTimeStamp() external view returns (uint256) {
        return s_lastTimeStamp;
    }

    function getRecentWinner() external view returns (address) {
        return s_recentWinner;
    }
}
