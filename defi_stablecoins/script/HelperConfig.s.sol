// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";

import {MockV3Aggregator} from "test/Mock/MockV3Aggregator.sol";

contract HelperConfig is Script {
    uint8 public constant DECIMALS = 8;
    int256 public constant ETH_USD_PRICE = 2000e8;
    int256 public constant BTC_USD_PRICE = 1000e8;

    struct NetworkConfig {
        address wEthUSDPriceFeedAddress;
        address wBtcUSDPriceFeedAddress;
        address wEthAddress;
        address wBtcAddress;
        uint256 deployerKey;
    }

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaETHConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilConfig();
        }
    }

    function getSepoliaETHConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({
            wBtcUSDPriceFeedAddress: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43,
            wEthUSDPriceFeedAddress: 0x694AA1769357215DE4FAC081bf1f309aDC325306,
            wEthAddress: 0xdd13E55209Fd76AfE204dBda4007C227904f0a81,
            wBtcAddress: 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063,
            deployerKey: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
        });
    }

    function getOrCreateAnvilConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.wEthUSDPriceFeedAddress != address(0)) {
            return activeNetworkConfig;
        }

        vm.startBroadcast();
        MockV3Aggregator ethMockAggregator = new MockV3Aggregator(DECIMALS, ETH_USD_PRICE);
        ERC20Mock wEthMock = new ERC20Mock("WETH", "WETH", msg.sender, 1000e8);

        MockV3Aggregator btcMockAggregator = new MockV3Aggregator(DECIMALS, BTC_USD_PRICE);
        ERC20Mock wBtcMock = new ERC20Mock("WBTC", "WBTC", msg.sender, 2000e8);
        vm.stopBroadcast();

        return NetworkConfig({
            wBtcUSDPriceFeedAddress: address(btcMockAggregator),
            wEthUSDPriceFeedAddress: address(ethMockAggregator),
            wEthAddress: address(wEthMock),
            wBtcAddress: address(wBtcMock),
            deployerKey: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
        });
    }

    function getActiveNetworkConfig() public view returns (NetworkConfig memory) {
        return activeNetworkConfig;
    }
}
