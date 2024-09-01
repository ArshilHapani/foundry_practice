//SPDX-License-Identifier:MIT

pragma solidity 0.8.24;

interface IDSCEngine {
    function depositCollateralAndMintDsc() external;

    function depositCollateral() external;

    function mintDsc() external;

    function redeemCollateralForDsc() external;

    function redeemCollateral() external;

    function burnDsc() external;

    function liquidate() external;

    function getHealthFactor() external view;
}
