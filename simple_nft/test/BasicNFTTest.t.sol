// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";

import {DeployBasicNFT} from "script/DeployBasicNFT.s.sol";
import {BasicNFT} from "src/BasicNFT.sol";

contract BasicNFTTest is Test {
    BasicNFT public basicNFT;
    address public USER = makeAddr("user");
    string public constant TOKEN_URI =
        "ipfs://bafkreih5odmc4xjiin6ghcyssierxvov5ej6auu6sx6zyrflzvt5ehru3q";

    function setUp() public {
        DeployBasicNFT deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.deployBasicNFT();
    }

    function testNameIsCorrect() public view {
        assertEq(basicNFT.name(), "Collections");
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(TOKEN_URI);

        assertEq(basicNFT.balanceOf(USER), 1);
        assertEq(basicNFT.tokenURI(0), TOKEN_URI);
    }
}
