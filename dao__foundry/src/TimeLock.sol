// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {TimelockController} from "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    /**
     *
     * @param minDelay How long we want to wait before executing
     * @param proposers List of addresses that can propose a transaction
     * @param executors List of addresses that can execute a transaction
     * @param admin The address that can change the proposers, executors and the delay
     */
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin)
        TimelockController(minDelay, proposers, executors, admin)
    {}
}
