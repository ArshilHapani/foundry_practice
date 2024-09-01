//SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {Errors} from "./utils/Errors.sol";

/**
 * @title Decentralized Stable Coin
 * @author Arshil Hapani
 * Collateral: Exogenous collateral (ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: 1:1 with USD
 *
 * System always be over-collateralized to avoid liquidation.
 *
 * This is the contract meant to be governed by DSCEngine. This contract is just the ERC20 implementation of the stable coin.
 */
contract DecentralizedStableCoin is ERC20Burnable, Ownable {
    constructor()
        ERC20("Decentralized Stable Coin", "DSC")
        Ownable(msg.sender)
    {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);

        if (_amount <= 0) {
            revert Errors.DecentralizedStableCoin__MustBeGreaterThanZero();
        }

        if (balance < _amount) {
            revert Errors.DecentralizedStableCoin__BurnAmountExceedsBalance();
        }

        super.burn(_amount);
    }

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert Errors.DecentralizedStableCoin__NotZeroAddress();
        }
        if (_amount < 0) {
            revert Errors.DecentralizedStableCoin__MustBeGreaterThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
