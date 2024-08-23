// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {VRFCoordinatorV2_5Mock} from "@chainlink/contracts/src/v0.8/vrf/mocks/VRFCoordinatorV2_5Mock.sol";

import {LinkToken} from "test/mocks/LinkToken.sol";

abstract contract CodeConstants {
    // Mock contract values
    uint96 public constant BASE_FEE = 0.25 ether;
    uint96 public constant GAS_PRICE_LINK = 1e9;
    int256 public constant WEI_PER_UNIT_LINK = 4e15;
    // Chain IDs
    uint256 public constant ETH_SEPOLIA_CHAIN_ID = 11155111;
    uint256 public constant LOCAL_ANVIL_CHAIN_ID = 31337;
}

error HelperConfig__InvalidChainID(uint256 chainId);

contract HelperConfig is Script, CodeConstants {
    struct NetworkConfig {
        uint256 entranceFee;
        uint256 interval;
        address vrfCoordinator;
        bytes32 keyHash;
        uint256 subId;
        uint32 callbackGasLimit;
        address link;
    }

    NetworkConfig public localNetworkConfig;
    mapping(uint256 => NetworkConfig) chainIdToConfig;

    constructor() {
        chainIdToConfig[ETH_SEPOLIA_CHAIN_ID] = getSepoliaEthConfig();
    }

    function getConfigByChainId(
        uint256 chainId
    ) public returns (NetworkConfig memory) {
        if (chainIdToConfig[chainId].vrfCoordinator != address(0)) {
            return chainIdToConfig[chainId];
        } else if (chainId == LOCAL_ANVIL_CHAIN_ID) {
            return getOrCreateAnvilETHConfig();
        } else {
            revert HelperConfig__InvalidChainID(chainId);
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        return
            NetworkConfig({
                entranceFee: 0.01 ether, //1e16
                interval: 30, // 30 seconds
                vrfCoordinator: 0x9DdfaCa8183c41ad55329BdeeD9F6A8d53168B1B,
                keyHash: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae,
                callbackGasLimit: 500000, //500,000 gas
                subId: 15366376269897563744780985323350096414521302377970374217356556294839422166091,
                // subId: 0,
                link: 0x779877A7B0D9E8603169DdbD7836e478b4624789
            });
    }

    function getOrCreateAnvilETHConfig() public returns (NetworkConfig memory) {
        if (localNetworkConfig.vrfCoordinator != address(0))
            return localNetworkConfig;

        vm.startBroadcast();
        VRFCoordinatorV2_5Mock vrfCoordinator = new VRFCoordinatorV2_5Mock(
            BASE_FEE,
            GAS_PRICE_LINK,
            WEI_PER_UNIT_LINK
        );
        LinkToken linkToken = new LinkToken();
        vm.stopBroadcast();
        localNetworkConfig = NetworkConfig({
            entranceFee: 0.01 ether, //1e16
            interval: 30, // 30 seconds
            vrfCoordinator: address(vrfCoordinator),
            keyHash: 0x787d74caea10b2b357790d5b5247c2f63d1d91572a9846f780606e4d953677ae,
            callbackGasLimit: 500000, //500,000 gas
            subId: 0,
            link: address(linkToken)
        });
        return localNetworkConfig;
    }

    function getConfig() public returns (NetworkConfig memory) {
        return getConfigByChainId(block.chainid);
    }
}
