// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {UUPSUpgradeable} from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol"; // used to set constructor
import {OwnableUpgradeable} from "lib/openzeppelin-contracts-upgradeable/contracts/access/Ownable2StepUpgradeable.sol";

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    /**
     * @notice As we cannot able to call the constructor in the upgradeable contract, we need to use the initializer function which is called by the proxy contract not by the contract itself.
     */

    function initialize(address initialOwner) public initializer {
        __Ownable_init(initialOwner); // initialize the owner (owner = msg.sender)
        __UUPSUpgradeable_init(); // initialize the upgradeable contract
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // here you can add some logic to only allow the owner to upgrade this contract
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }
}
