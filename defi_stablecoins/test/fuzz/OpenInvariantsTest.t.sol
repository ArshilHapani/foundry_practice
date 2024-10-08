// SPDX-License-Identifier: MIT
// /**
//  * List of invariants
//  *
//  * 1. The total DSC minted must be less than deposited collateral
//  * 2. Getter view functions should never revert
//  */
pragma solidity 0.8.24;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// import {DeployDSC} from "script/DeployDSC.s.sol";
// import {HelperConfig} from "script/HelperConfig.s.sol";
// import {DSCEngine} from "src/DSCEngine.sol";
// import {DecentralizedStableCoin} from "src/DecentralizedStableCoin.sol";

// contract OpenInvariantsTest is StdInvariant, Test {
//     DeployDSC deployDsc;
//     DSCEngine dscEngine;
//     DecentralizedStableCoin dsc;
//     HelperConfig helperConfig;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         deployDsc = new DeployDSC();
//         (dsc, dscEngine, helperConfig) = deployDsc.run();
//         (,, weth, wbtc,) = helperConfig.activeNetworkConfig();
//         targetContract(address(dscEngine)); // setup fuzzing target contract
//     }

//     function invariant_totalDSCMintedLessThanDepositedCollateral() public view {
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 wethDeposited = IERC20(weth).balanceOf(address(dscEngine));
//         uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(dscEngine));

//         uint256 wEthValueInUsd = dscEngine.getUSDValue(weth, wethDeposited);
//         uint256 wBtcValueInUsd = dscEngine.getUSDValue(wbtc, totalBtcDeposited);

//         assert(totalSupply <= wEthValueInUsd + wBtcValueInUsd);
//     }
// }
