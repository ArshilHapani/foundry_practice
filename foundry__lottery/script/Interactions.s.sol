// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

import {HelperConfig} from "script/HelperConfig.s.sol";
import {CodeConstants} from "script/HelperConfig.s.sol";
import {LinkToken} from "test/mocks/LinkToken.sol";

contract CreateSubscription is Script {
    function createSubscriptionRaw() public returns (uint256, address) {
        HelperConfig helperConfig = new HelperConfig();
        address vrfCoordinator = helperConfig.getConfig().vrfCoordinator;
        (uint256 subId, ) = createSubscription(
            vrfCoordinator,
            helperConfig.getConfig().account
        );
        return (subId, vrfCoordinator);
    }

    function createSubscription(
        address _vrfCoordinator,
        address _account
    ) public returns (uint256, address) {
        vm.startBroadcast(_account);
        uint256 subId = VRFCoordinatorV2_5Mock(_vrfCoordinator)
            .createSubscription();
        vm.stopBroadcast();
        return (subId, _vrfCoordinator);
    }

    function run() external {
        createSubscriptionRaw();
    }
}

contract FundSubscription is Script, CodeConstants {
    uint256 private constant FUND_AMOUNT = 3 ether; // 3 LINK

    function fundSubscriptionRaw() public {
        HelperConfig helperConfig = new HelperConfig();
        address vrfCoordinator = helperConfig.getConfig().vrfCoordinator;
        uint256 subscriptionId = helperConfig.getConfig().subId;
        address linkToken = helperConfig.getConfig().link;

        fundSubscription(
            vrfCoordinator,
            subscriptionId,
            linkToken,
            helperConfig.getConfig().account
        );
    }

    function fundSubscription(
        address _vrfCoordinator,
        uint256 _subscriptionId,
        address _linkToken,
        address _account
    ) public {
        if (block.chainid == LOCAL_ANVIL_CHAIN_ID) {
            vm.startBroadcast();
            VRFCoordinatorV2_5Mock(_vrfCoordinator).fundSubscription(
                _subscriptionId,
                FUND_AMOUNT * 100
            );
            vm.stopBroadcast();
        } else {
            vm.startBroadcast(_account);
            LinkToken(_linkToken).transferAndCall(
                _vrfCoordinator,
                FUND_AMOUNT,
                abi.encode(_subscriptionId)
            );
            vm.stopBroadcast();
        }
    }

    function run() external {
        fundSubscriptionRaw();
    }
}

contract AddConsumer is Script {
    function addConsumerRaw(address _mostRecentDeployment) public {
        HelperConfig helperConfig = new HelperConfig();
        uint256 subId = helperConfig.getConfig().subId;
        address vrfCoordinator = helperConfig.getConfig().vrfCoordinator;
        addConsumer(
            _mostRecentDeployment,
            vrfCoordinator,
            subId,
            helperConfig.getConfig().account
        );
    }

    function addConsumer(
        address _contractToAddToVrf,
        address _vrfCoordinator,
        uint256 _subId,
        address _account
    ) public {
        vm.startBroadcast(_account);
        VRFCoordinatorV2_5Mock(_vrfCoordinator).addConsumer(
            _subId,
            _contractToAddToVrf
        );
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "Lottery",
            block.chainid
        );
        addConsumerRaw(mostRecentlyDeployed);
    }
}
