// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";

import {DeployBox} from "script/DeployBox.s.sol";
import {UpgradeBox} from "script/UpgradeBox.s.sol";
import {BoxV1} from "src/BoxV1.sol";
import {BoxV2} from "src/BoxV2.sol";

contract DeployAndUpgradeBoxes is Test {
    DeployBox deployBox;
    UpgradeBox upgradeBox;
    address public OWNER = makeAddr("nami");

    address proxy;
    BoxV2 boxV2;

    function setUp() external {
        deployBox = new DeployBox();
        upgradeBox = new UpgradeBox();

        proxy = deployBox.deployBox(); // point to BoxV1
    }

    function testInitialProxyToBoxV1() external {
        vm.expectRevert();
        BoxV2(proxy).setNumber(10);
    }

    function testUpdates() external {
        boxV2 = new BoxV2();

        upgradeBox.upgradeBoxProxy(proxy, address(boxV2));

        uint256 expected = 2;
        BoxV2 box = BoxV2(proxy);
        box.setNumber(10);

        assertEq(expected, box.version());
        assertEq(10, box.getNumber());
    }
}
// 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
