//SPDX-License-Identifier:MIT

pragma solidity 0.8.24;

import {IDSCEngine} from "./interfaces/IDSCEngine.sol";

/*
 * @title DSCEngine
 * @author Arshil Hapani
 * Token maintain  1$ to 1 DSC
 * Properties of this stable coin
 * - Exogenous collateral
 * - Algorithmic minting
 * - Dollar pegged
 *
 * It is similar to DAI to DAI has no governance, no fees, and was only backed by wETH and wBTC.
 *
 * @notice This contract is core of DSC system. It handles all the logic for minting and redeeming DSC, as well as depositing and withdrawing collateral.
 */
contract DSCEngine is IDSCEngine {
    function depositCollateralAndMintDsc() external override {
        // Logic for depositing collateral and minting DSC
    }

    function depositCollateral() external override {
        // Logic for depositing collateral
    }

    function mintDsc() external override {
        // Logic for minting DSC
    }

    function redeemCollateralForDsc() external override {
        // Logic for redeeming collateral for DSC
    }

    function redeemCollateral() external override {
        // Logic for redeeming collateral
    }

    function burnDsc() external override {
        // Logic for burning DSC
    }

    function liquidate() external override {
        // Logic for liquidating
    }

    function getHealthFactor() external view override {
        // Logic for getting health factor
    }
}
