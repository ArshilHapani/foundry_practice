// SPDX-License-Identifier:MIT
pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";

import {Lottery} from "src/Lottery.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {CreateSubscription, FundSubscription, AddConsumer} from "./Interactions.s.sol";

contract DeployLottery is Script {
    function deployContract() public returns (Lottery, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory networkConfig = helperConfig
            .getConfig();

        if (networkConfig.subId == 0) {
            // creating subscription
            CreateSubscription createSubscription = new CreateSubscription();
            (
                networkConfig.subId,
                networkConfig.vrfCoordinator
            ) = createSubscription.createSubscription(
                networkConfig.vrfCoordinator,
                networkConfig.account
            );

            // fund subscription
            FundSubscription fundSubscription = new FundSubscription();
            fundSubscription.fundSubscription(
                networkConfig.vrfCoordinator,
                networkConfig.subId,
                networkConfig.link,
                networkConfig.account
            );
        }

        vm.startBroadcast(networkConfig.account);
        Lottery lottery = new Lottery(
            networkConfig.entranceFee,
            networkConfig.interval,
            networkConfig.vrfCoordinator,
            networkConfig.keyHash,
            networkConfig.subId,
            networkConfig.callbackGasLimit
        );
        vm.stopBroadcast();

        AddConsumer addConsumer = new AddConsumer();
        addConsumer.addConsumer(
            address(lottery),
            networkConfig.vrfCoordinator,
            networkConfig.subId,
            networkConfig.account
        );

        return (lottery, helperConfig);
    }

    function run() external {
        deployContract();
    }
}
