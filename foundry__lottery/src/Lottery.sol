// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";

import {Errors} from "./utils/Errors.sol";
import {Events} from "./utils/Events.sol";

contract Lottery is VRFConsumerBaseV2Plus {
    uint16 private constant REQUEST_CONFIRMATIONS = 2;
    uint32 private constant NUM_OF_WORDS = 1;

    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    bytes32 private immutable i_keyHash;
    uint256 private immutable i_subscriptionId;
    uint32 private immutable i_callbackGasLimit;

    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

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
    }

    function enterLottery() external payable {
        // require(msg.value >= i_entranceFee,Lottery__NotEnoughEntranceFee()); // for 0.8.26
        if (msg.value < i_entranceFee) {
            revert Errors.Lottery__NotEnoughEntranceFee();
        }
        s_players.push(payable(msg.sender));
        emit Events.Lottery__PlayerEntered(msg.sender);
    }

    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert Errors.Lottery__NotEnoughTimePassed();
        }

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
    }

    function fulfillRandomWords(
        uint256 requestId,
        uint256[] calldata randomWords
    ) internal override {}

    //** Getters */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
