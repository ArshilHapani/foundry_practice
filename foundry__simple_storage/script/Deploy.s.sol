// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract Deploy is Script {
    function run() external returns (SimpleStorage) {
        // everything after `startBroadcast()` will sent to rpc
        vm.startBroadcast(); // only for foundry

        SimpleStorage simpleStorage = new SimpleStorage(); // creates new contract on blockchain

        vm.stopBroadcast();
        // stops broadcasting to rpc

        return simpleStorage;
    }
}
