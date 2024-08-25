// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

import {BasicNFT} from "src/BasicNFT.sol";

abstract contract CodeConstants {
    uint256 public constant ETH_SEPOLIA_CHAIN_ID = 11155111;
    uint256 public constant LOCAL_ANVIL_CHAIN_ID = 31337;
}

contract MintBasicNFT is Script {
    string public constant TOKEN_URI =
        "ipfs://bafkreih5odmc4xjiin6ghcyssierxvov5ej6auu6sx6zyrflzvt5ehru3q";

    function run() public {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNFT",
            block.chainid
        );
        mintNFTOnContract(mostRecentDeployed);
    }

    function mintNFTOnContract(address _basicNFTAddress) public {
        vm.startBroadcast();
        BasicNFT(_basicNFTAddress).mintNFT(TOKEN_URI);
        vm.stopBroadcast();
    }
}
