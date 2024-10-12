// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract SmallProxy is Proxy {
    // This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
    bytes32 private constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function setImplementation(address newImplementation) public {
        assembly {
            sstore(_IMPLEMENTATION_SLOT, newImplementation)
        }
    }

    function _implementation() internal view override returns (address implementationAddress) {
        assembly {
            implementationAddress := sload(_IMPLEMENTATION_SLOT)
        }
    }

    function getDataToUpdate(uint256 _newNumber) public pure returns (bytes memory) {
        return abi.encodeWithSignature("setValue(uint256)", _newNumber);
    }

    function readStorage() public view returns (uint256 valueAtSlotZero) {
        assembly {
            valueAtSlotZero := sload(0)
        }
    }

    receive() external payable {}
}

contract ImplementationA {
    uint256 public value;

    function setValue(uint256 _value) public {
        value = _value;
    }
}
