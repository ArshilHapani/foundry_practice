// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script, console2} from "forge-std/Script.sol";
import {EntryPoint} from "account-abstraction/core/EntryPoint.sol";

error HelperConfig__InvalidChainId();

struct NetworkConfig {
    address entryPoint;
    address account;
}

contract HelperConfig is Script {
    uint256 constant ETH_SEPOLIA_CHAINID = 11155111;
    uint256 constant ZKSYNC_SEPOLIA_CHAINID = 300;
    uint256 constant LOCAL_CHAIN_ID = 31337;
    address constant BURNER_WALLET = 0x7de7080aB6FFb3F1435378f3E7F15DfAE92c6F3a;
    // address constant DEFAULT_SENDER = 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38;

    NetworkConfig public localNetworkConfig;
    mapping(uint256 chainId => NetworkConfig) networkConfigs;

    constructor() {
        networkConfigs[ETH_SEPOLIA_CHAINID] = getEthSepoliaConfig();
        networkConfigs[ZKSYNC_SEPOLIA_CHAINID] = getZkSyncSepoliaConfig();
        networkConfigs[LOCAL_CHAIN_ID] = getOrCreateAnvilConfig();
    }

    function getConfig() public view returns (NetworkConfig memory) {
        return getConfigByChainId(block.chainid);
    }

    function getConfigByChainId(uint256 _chainId) public view returns (NetworkConfig memory) {
        if (_chainId == ETH_SEPOLIA_CHAINID) {
            return getEthSepoliaConfig();
        } else if (networkConfigs[_chainId].account != address(0)) {
            return networkConfigs[_chainId];
        } else if (_chainId == ZKSYNC_SEPOLIA_CHAINID) {
            // special case for zkSync (though zkSync dose'nt support script but still this is future proof... 🛡️)
            return getZkSyncSepoliaConfig();
        } else {
            revert HelperConfig__InvalidChainId();
        }
    }

    function getEthSepoliaConfig() internal pure returns (NetworkConfig memory) {
        return NetworkConfig(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789, BURNER_WALLET);
    }

    function getZkSyncSepoliaConfig() internal pure returns (NetworkConfig memory) {
        return NetworkConfig(address(0), BURNER_WALLET); // native account abstraction
    }

    function getOrCreateAnvilConfig() internal returns (NetworkConfig memory) {
        if (localNetworkConfig.account != address(0)) {
            return localNetworkConfig;
        }
        // deploy mocks...
        console2.log("Deploying mocks for local chain...");

        vm.startBroadcast(DEFAULT_SENDER);
        EntryPoint entryPoint = new EntryPoint();
        vm.stopBroadcast();

        return NetworkConfig(address(entryPoint), DEFAULT_SENDER);
    }
}
