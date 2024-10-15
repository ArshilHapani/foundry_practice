// SPDX-License-Identifier:MIT

pragma solidity 0.8.25;

library Errors {
    error MinimumAccount__InvalidSigner();
    error MinimumAccount__RequireEntryPointToCallThisFunction();
    error MinimumAccount__RequireEntryPointOrOwnerToCallThisFunction();
    error MinimumAccount__CallFailed(bytes revertReason);
}
