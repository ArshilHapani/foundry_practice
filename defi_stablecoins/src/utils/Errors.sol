//SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

library Errors {
    error DecentralizedStableCoin__MustBeGreaterThanZero();
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__NotZeroAddress();
}
