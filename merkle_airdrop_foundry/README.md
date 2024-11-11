## ECRecover

This function is used to recover the signer from any message with the help of v,r,s signature component

This is the code snippet for the ECRecover function

```solidity
function ECRecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
    return ecrecover(hash, v, r, s);
}
```
