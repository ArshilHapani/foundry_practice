// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Box is Ownable {
    event NumberChanged(uint256 newValue);

    uint256 private s_number;

    constructor() Ownable(msg.sender) {}

    function setNumber(uint256 _number) external onlyOwner {
        s_number = _number;
        emit NumberChanged(_number);
    }

    function getNumber() external view returns (uint256) {
        return s_number;
    }
}
