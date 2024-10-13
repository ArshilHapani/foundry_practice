// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

import {BoxV2} from "src/BoxV2.sol";
import {BoxV1} from "src/BoxV1.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployedProxy = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        BoxV2 box = new BoxV2();
        vm.stopBroadcast();

        address newProxy = upgradeBoxProxy(mostRecentlyDeployedProxy, address(box));
        return newProxy;
    }

    function upgradeBoxProxy(address oldProxy, address newImplementation) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(oldProxy);
        proxy.upgradeToAndCall(address(newImplementation), "");
        // proxy.upgradeTo(address(newImplementation));
        vm.stopBroadcast();
        return oldProxy;
    }
}

contract DeployBoxV2 is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        BoxV2 box = new BoxV2();
        vm.stopBroadcast();
        return address(box);
    }
}
