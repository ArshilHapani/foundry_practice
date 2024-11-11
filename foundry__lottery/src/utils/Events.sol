// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

library Events {
    event Lottery__PlayerEntered(address indexed player);
    event Lottery__WinnerPicked(address indexed winner);
    event Lottery__RequestedRandomWinner(uint256 indexed requestId);
}
