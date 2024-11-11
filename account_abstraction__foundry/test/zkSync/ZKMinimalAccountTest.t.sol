//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Test} from "forge-std/Test.sol";
import {Transaction} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";
import {MemoryTransactionHelper} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/libraries/MemoryTransactionHelper.sol";
import {BOOTLOADER_FORMAL_ADDRESS} from "@cyfrin-foundry-era-contracts/system-contracts/contracts/Constants.sol";
import {ACCOUNT_VALIDATION_SUCCESS_MAGIC} from
    "@cyfrin-foundry-era-contracts/system-contracts/contracts/interfaces/IAccount.sol";

import {ERC20Mock} from "@openzeppelin/contracts/mocks/token/ERC20Mock.sol";

import {ZKMinimalAccount} from "src/zksync/ZKMinimalAccount.sol";

contract ZKMinimalAccountTest is Test {
    ZKMinimalAccount minimalAccount;
    ERC20Mock usdc;

    uint256 constant AMOUNT = 5 ether;
    uint256 constant WALLET_BALANCE = 10 ether;
    bytes32 constant ZERO_BYTES32 = bytes32(0);
    address public constant DEFAULT_SENDER_ANVIL = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
    uint256 public constant DEFAULT_PRIVATE_KEY_ANVIL =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    function setUp() external {
        minimalAccount = new ZKMinimalAccount();
        usdc = new ERC20Mock();
        minimalAccount.transferOwnership(DEFAULT_SENDER_ANVIL);
        vm.deal(address(minimalAccount), WALLET_BALANCE);
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

    function testZkValidateTransaction() external {
        // arrange
        address dest = address(usdc);
        uint256 value = 0;
        bytes memory functionData = abi.encodeWithSelector(ERC20Mock.mint.selector, address(minimalAccount), AMOUNT);
        Transaction memory transaction =
            _createUnsignedTransaction(minimalAccount.owner(), 0x71, dest, value, functionData);
        transaction = _signTransaction(transaction);

        // act
        // acting as bootloader system contract
        vm.prank(BOOTLOADER_FORMAL_ADDRESS);
        bytes4 magic = minimalAccount.validateTransaction(ZERO_BYTES32, ZERO_BYTES32, transaction);

        // assert
        assertEq(magic, ACCOUNT_VALIDATION_SUCCESS_MAGIC);
    }

    //////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// HELPERS ////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////

    function _signTransaction(Transaction memory _transaction) internal view returns (Transaction memory) {
        bytes32 unsignedTransactionHash = MemoryTransactionHelper.encodeHash(_transaction);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(DEFAULT_PRIVATE_KEY_ANVIL, unsignedTransactionHash);

        Transaction memory signedTransaction = _transaction;
        signedTransaction.signature = abi.encodePacked(r, s, v);
        return signedTransaction;
    }

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
