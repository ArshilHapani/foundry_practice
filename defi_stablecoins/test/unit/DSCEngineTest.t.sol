// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
// erc20 mock
import {ERC20Mock} from "openzeppelin-contracts/contracts/mocks/ERC20Mock.sol";

import {DSCEngine} from "src/DSCEngine.sol";
import {DecentralizedStableCoin} from "src/DecentralizedStableCoin.sol";
import {Errors} from "src/utils/Errors.sol";

import {HelperConfig} from "script/HelperConfig.s.sol";
import {DeployDSC} from "script/DeployDSC.s.sol";
import {DSCEngineTest} from "test/unit/DSCEngineTest.t.sol";

contract DSCEngineTest is Test {
    DecentralizedStableCoin dsc;
    DSCEngine engine;
    DeployDSC deployer;
    HelperConfig config;

    address ethUSDPriceFeed;
    address wbtcPriceFeed;
    address wEth;
    address wBtc;
    uint256 public constant AMOUNT_COLLATERAL = 100 ether;
    uint256 public constant STARTING_ERC20_BALANCE = 10 ether;

    address public USER = makeAddr("user");

    function setUp() external {
        deployer = new DeployDSC();
        (dsc, engine, config) = deployer.run();
        (ethUSDPriceFeed, wbtcPriceFeed, wEth, wBtc,) = config.activeNetworkConfig();

        ERC20Mock(wEth).mint(USER, STARTING_ERC20_BALANCE);
    }

    ///////////////////////////////
    //// constructor test ////////
    /////////////////////////////a

    address[] public tokenAddresses;
    address[] public priceFeedAddresses;

    function testConstructorIfTokenAddressLengthAreInvalid() external {
        tokenAddresses.push(wEth);
        priceFeedAddresses.push(ethUSDPriceFeed);
        tokenAddresses.push(wBtc);
        vm.expectRevert(Errors.DSCEngine__ArrayLengthMismatch.selector);
        new DSCEngine(tokenAddresses, priceFeedAddresses, address(dsc));
    }

    //////////////////////////
    //// price feeds ////////
    ////////////////////////

    function testGetUsdValue() external {
        uint256 ethAmount = 10 ether;
        uint256 expected = 20000e18;
        uint256 actual = engine.getUSDValue(wEth, ethAmount);

        assertEq(actual, expected);
    }

    function testGetTokenAmountFromUSD() external {
        uint256 usdAmount = 100 ether;
        uint256 expected = 0.055 ether;

        uint256 actualWeth = engine.getTokenAmountFromUsd(wEth, usdAmount);

        assertEq(actualWeth, expected);
    }

    ///////////////////////////////
    //// depositCollateral ////////
    /////////////////////////////

    function testRevertIfCollateralIsZero() external {
        vm.prank(USER);
        ERC20Mock(wEth).approve(address(engine), AMOUNT_COLLATERAL);

        vm.expectRevert(Errors.DSCEngine__MustBeGreaterThanZero.selector);
        engine.depositCollateral(wEth, 0);
        vm.stopPrank();
    }

    function testRevertIfCollateralIsNotApproved() external {
        ERC20Mock namiToken = new ERC20Mock("Nami", "NAMI", USER, AMOUNT_COLLATERAL);

        vm.startPrank(USER);

        vm.expectRevert(Errors.DSCEngine__NotAllowedToken.selector);
        engine.depositCollateral(address(namiToken), AMOUNT_COLLATERAL);
        vm.stopPrank();
    }

    function testCanDepositCollateralAndGetAccountInfo() external depositCollateral {
        (uint256 totalDSCMinted, uint256 collateralValueInUSD) = engine.getAccountInformation(USER);

        uint256 expectedDepositedAmount = engine.getTokenAmountFromUsd(wEth, collateralValueInUSD);

        assertEq(totalDSCMinted, 0);
        assertEq(AMOUNT_COLLATERAL, expectedDepositedAmount);
    }

    modifier depositCollateral() {
        vm.startPrank(USER);
        ERC20Mock(wEth).approve(address(engine), AMOUNT_COLLATERAL);
        engine.depositCollateral(wEth, AMOUNT_COLLATERAL);
        vm.stopPrank();
        _;
    }
}
