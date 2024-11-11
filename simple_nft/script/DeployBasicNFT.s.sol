// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";

import {BasicNFT} from "src/BasicNFT.sol";

contract DeployBasicNFT is Script {
    function run() external {
        deployBasicNFT();
    }

    function deployBasicNFT() public returns (BasicNFT) {
        BasicNFT basicNFT;
        vm.startBroadcast();
        basicNFT = new BasicNFT();
        vm.stopBroadcast();
        return basicNFT;
    }
}
