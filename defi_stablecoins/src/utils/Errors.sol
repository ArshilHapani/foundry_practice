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
    error DSCEngine__HealthFactorTooLow(uint256 _healthFactor);
    error DSCEngine__MintFailed();
    error DSCEngine__HealthFactorNotBroken();
    error DSCEngine__HealthFactorNotImproved();

    error OracleLib__StalePrice();
}
