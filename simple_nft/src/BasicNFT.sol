// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;

    constructor() ERC721("Collections", "SPT") {}

    function mintNFT(string memory _tokenURI) public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToURI[s_tokenCounter] = _tokenURI;
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToURI[_tokenId];
    }
}
