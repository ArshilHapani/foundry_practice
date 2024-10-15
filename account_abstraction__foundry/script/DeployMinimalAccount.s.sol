// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";

import {MinimumAccount} from "src/ethereum/MinimumAccount.sol";

import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployMinimalAccount is Script {
    function run() external {}

    function deployMinimalAccount() public returns (HelperConfig, MinimumAccount) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        vm.startBroadcast(config.account);
        MinimumAccount minimumAccount = new MinimumAccount(config.entryPoint);
        minimumAccount.transferOwnership(msg.sender); // transfer ownership to the sender
        vm.stopBroadcast();

        return (helperConfig, minimumAccount);
    }
}
