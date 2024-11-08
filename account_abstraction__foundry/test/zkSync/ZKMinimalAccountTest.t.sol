//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import {Transaction} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";
import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

import {ZKMinimalAccount} from "src/zksync/ZKMinimalAccount.sol";

contract ZKMinimalAccountTest is Test {
    ZKMinimalAccount minimalAccount;
    ERC20Mock usdc;

    uint256 constant AMOUNT = 5 ether;
    bytes32 constant ZERO_BYTES32 = bytes32(0);

    function setUp() external {
        minimalAccount = new ZKMinimalAccount();
        usdc = new ERC20Mock();
    }

    function testZkOwnerCanExecuteCommands() external {
        // arrange
        address dest = address(usdc);
        uint256 value = 0;
        bytes memory functionData = abi.encodeWithSelector(ERC20Mock.mint.selector, address(minimalAccount), AMOUNT);

        Transaction memory transaction =
            _createUnsignedTransaction(minimalAccount.owner(), 0x71, dest, value, functionData);

        // act
        vm.prank(minimalAccount.owner());
        minimalAccount.executeTransaction(ZERO_BYTES32, ZERO_BYTES32, transaction);

        // assert
        assertEq(usdc.balanceOf(address(minimalAccount)), AMOUNT);
    }

    //////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// HELPERS ////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////

    function _createUnsignedTransaction(address _from, uint8 _txType, address _to, uint256 _value, bytes memory _data)
        internal
        view
        returns (Transaction memory)
    {
        uint128 verificationGasLimit = 16777216;
        uint256 nonce = vm.getNonce(address(minimalAccount));
        bytes32[] memory factoryDeps = new bytes32[](0);

        return Transaction({
            txType: _txType, // 113 (0x71)
            from: addressToUint256(_from),
            to: addressToUint256(_to),
            gasLimit: verificationGasLimit,
            gasPerPubdataByteLimit: verificationGasLimit,
            maxFeePerGas: verificationGasLimit,
            maxPriorityFeePerGas: verificationGasLimit,
            paymaster: 0,
            nonce: nonce,
            value: _value,
            reserved: [uint256(0), uint256(0), uint256(0), uint256(0)],
            data: _data,
            signature: hex"",
            factoryDeps: factoryDeps,
            paymasterInput: hex"",
            reservedDynamic: hex""
        });
    }

    function addressToUint256(address _address) internal pure returns (uint256) {
        return uint256(uint160(_address));
    }
}
