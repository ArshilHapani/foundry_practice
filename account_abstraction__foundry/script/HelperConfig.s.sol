// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Script, console2} from "forge-std/Script.sol";
import {EntryPoint} from "account-abstraction/core/EntryPoint.sol";

error HelperConfig__InvalidChainId();

abstract contract CodeConstants {
    uint256 public constant ETH_SEPOLIA_CHAINID = 11155111;
    uint256 public constant ZKSYNC_SEPOLIA_CHAINID = 300;
    uint256 public constant LOCAL_CHAIN_ID = 31337;
    uint256 public constant POLYGON_AMONY_CHAIN_ID = 80002;
    address public constant BURNER_WALLET = 0x7de7080aB6FFb3F1435378f3E7F15DfAE92c6F3a;
    address public constant DEFAULT_SENDER_ANVIL = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    uint256 public constant DEFAULT_PRIVATE_KEY_ANVIL =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
}

struct NetworkConfig {
    address entryPoint;
    address account;
}

contract HelperConfig is Script, CodeConstants {
    NetworkConfig public localNetworkConfig;
    mapping(uint256 chainId => NetworkConfig) networkConfigs;

    constructor() {
        networkConfigs[ETH_SEPOLIA_CHAINID] = getEthSepoliaConfig();
        networkConfigs[ZKSYNC_SEPOLIA_CHAINID] = getZkSyncSepoliaConfig();
        networkConfigs[POLYGON_AMONY_CHAIN_ID] = getPolygonAmonyConfig();
    }

    function getConfig() public returns (NetworkConfig memory) {
        console2.log("ChainId: ", block.chainid);
        return getConfigByChainId(block.chainid);
    }

    function getConfigByChainId(uint256 _chainId) public returns (NetworkConfig memory) {
        if (networkConfigs[_chainId].account != address(0)) {
            return networkConfigs[_chainId];
        } else if (_chainId == ZKSYNC_SEPOLIA_CHAINID) {
            // special case for zkSync (though zkSync dose'nt support script but still this is future proof... 🛡️)
            return getZkSyncSepoliaConfig();
        } else if (_chainId == LOCAL_CHAIN_ID) {
            return getOrCreateAnvilConfig();
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

    function getPolygonAmonyConfig() internal pure returns (NetworkConfig memory) {
        return NetworkConfig(0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789, BURNER_WALLET);
    }

    function getOrCreateAnvilConfig() internal returns (NetworkConfig memory) {
        if (localNetworkConfig.account != address(0)) {
            return localNetworkConfig;
        }
        // deploy mocks...
        console2.log("Deploying mocks for local chain...");

        vm.startBroadcast(DEFAULT_SENDER_ANVIL);
        EntryPoint entryPoint = new EntryPoint();
        vm.stopBroadcast();

        localNetworkConfig = NetworkConfig(address(entryPoint), DEFAULT_SENDER_ANVIL);

        return localNetworkConfig;
    }
}
