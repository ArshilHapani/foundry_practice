// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";

import {MinimalAccount} from "src/ethereum/MinimalAccount.sol";

import {HelperConfig, NetworkConfig} from "./HelperConfig.s.sol";

contract DeployMinimalAccount is Script {
    function run() external {}

    function deployMinimalAccount() public returns (HelperConfig, MinimalAccount) {
        HelperConfig helperConfig = new HelperConfig();
        NetworkConfig memory config = helperConfig.getConfig();

        vm.startBroadcast(config.account);
        MinimalAccount minimalAccount = new MinimalAccount(config.entryPoint);
        minimalAccount.transferOwnership(config.account); // transfer ownership to the sender
        vm.stopBroadcast();

        return (helperConfig, minimalAccount);
    }
}
