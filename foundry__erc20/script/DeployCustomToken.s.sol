// SPDX-License-Identifier:MIT
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {CustomToken} from "src/CustomToken.sol";

contract DeployCustomToken is Script {
    uint256 public constant INITIAL_SUPPLY = 10000000_000000000000000000;

    function run() external {
        deployCustomToken();
    }

    function deployCustomToken() public returns (CustomToken) {
        console.log("Deployer address: ", msg.sender);

        vm.startBroadcast();
        CustomToken customToken = new CustomToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return customToken;
    }
}
