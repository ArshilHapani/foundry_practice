//SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

library DSCEngineEvents {
    event CollateralDeposited(address indexed user, address indexed token, uint256 amount);
    event CollateralRedeemed(
        address indexed redeemedFrom, address indexed redeemedTo, address indexed token, uint256 amount
    );
}
