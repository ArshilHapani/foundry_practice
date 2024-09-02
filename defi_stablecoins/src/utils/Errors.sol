//SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

library Errors {
    error DecentralizedStableCoin__MustBeGreaterThanZero();
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    error DecentralizedStableCoin__NotZeroAddress();

    error DSCEngine__MustBeGreaterThanZero();
    error DSCEngine__ArrayLengthMismatch();
    error DSCEngine__NotAllowedToken();
    error DSCEngine__TransferFailed();
}
