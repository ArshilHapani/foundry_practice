// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 SEND_VALUE = 1 ether;

    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        fundFundMe(mostRecentDeployed);
        vm.stopBroadcast();
    }

    function fundFundMe(address _fundMe) public {
        FundMe(payable(_fundMe)).fund{value: SEND_VALUE}();
        console.log("Funded fundMe with %s ether", SEND_VALUE / 1 ether);
    }
}

contract WithdrawFundMe is Script {
    function run() external {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        vm.startBroadcast();
        withDrawFundMe(mostRecentDeployed);
        vm.stopBroadcast();
    }

    function withDrawFundMe(address _fundMe) public {
        vm.startBroadcast();
        FundMe(payable(_fundMe)).withdraw();
        vm.stopBroadcast();
    }
}
