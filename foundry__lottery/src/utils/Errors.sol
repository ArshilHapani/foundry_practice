// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

library Errors {
    error Lottery__NotEnoughEntranceFee();
    error Lottery__NotEnoughTimePassed();
    error Lottery__FailedToTransferFundToWinner();
    error Lottery__LotteryNotOpen();
    error Lottery__UpkeepNotNeeded(
        uint256 balance,
        uint256 length,
        uint256 state
    );
}
