// SPDX-License-Identifier:MIT
pragma solidity 0.8.24;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("Nami", "NXR") {
        _mint(msg.sender, _initialSupply);
    }
}
