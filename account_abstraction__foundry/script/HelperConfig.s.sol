// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script} from "forge-std/Script.sol";

error HelperConfig__InvalidChainId();

contract HelperConfig {
    struct NetworkConfig {
        address entryPoint;
        address account;
    }

    uint256 constant ETH_SEPOLIA_CHAINID = 11155111;
    uint256 constant ZKSYNC_SEPOLIA_CHAINID = 300;
    uint256 constant LOCAL_CHAIN_ID = 31337;
    address constant BURNER_WALLET = 0x7de7080aB6FFb3F1435378f3E7F15DfAE92c6F3a;

    NetworkConfig public localNetworkConfig;
    mapping(uint256 chainId => NetworkConfig) networkConfigs;

    constructor() {
        networkConfigs[ETH_SEPOLIA_CHAINID] = getEthSepoliaConfig();
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

    function getOrCreateAnvilConfig() internal view returns (NetworkConfig memory) {
        if (localNetworkConfig.account != address(0)) {
            return localNetworkConfig;
        }
        // deploy mocks...
    }
}
