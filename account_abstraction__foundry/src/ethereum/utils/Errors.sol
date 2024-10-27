// SPDX-License-Identifier:MIT

pragma solidity 0.8.25;

library Errors {
    /**
     * @dev Error thrown when caller is not the entry point
     */
    error MinimumAccount__InvalidSigner();

    /**
     * @dev Error thrown when caller is not the entry point or owner
     */
    error MinimumAccount__RequireEntryPointToCallThisFunction();

    /**
     * @dev Error thrown when caller is not the entry point or owner
     */
    error MinimumAccount__RequireEntryPointOrOwnerToCallThisFunction();

    /**
     * @dev Error thrown when signature validation fails
     */
    error MinimumAccount__CallFailed(bytes revertReason);
}
