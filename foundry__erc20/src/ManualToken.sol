// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ManualToken {
    mapping(address => uint256) private s_addressToBalance;

    function name() public pure returns (string memory) {
        return "Nami Robin";
    }

    function symbol() public pure returns (string memory) {
        return "NAMIXROBIN";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 1000000000_000000000000000000;
    }

    function balanceOf(address _user) public view returns (uint256) {
        return s_addressToBalance[_user];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            s_addressToBalance[msg.sender] >= _value,
            "ManualToken: insufficient balance"
        );

        s_addressToBalance[msg.sender] -= _value;
        s_addressToBalance[_to] += _value;

        return true;
    }
}
