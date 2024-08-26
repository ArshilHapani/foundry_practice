// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

error MoodNFT__OnlyOwnerCanPerformThisOperation();

contract MoodNFT is ERC721 {
    enum Mood {
        HAPPY,
        SAD
    }

    uint256 private s_tokenCounter;
    string private s_sadSVGEncodedURI;
    string private s_happySVGEncodedURI;
    mapping(uint256 => Mood) private s_idToMood;

    constructor(
        string memory _sadSVGEncodedURI,
        string memory _happySVGEncodedURI
    ) ERC721("MoodNFT", "MFT") {
        s_sadSVGEncodedURI = _sadSVGEncodedURI;
        s_happySVGEncodedURI = _happySVGEncodedURI;
        s_idToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter = 0;
    }

    function mintNFT() public {
        s_tokenCounter++;
        _safeMint(msg.sender, s_tokenCounter);
    }

    function flipMood(uint256 _tokenId) public onlyOwner(_tokenId) {
        Mood mood = s_idToMood[_tokenId];
        s_idToMood[_tokenId] = mood == Mood.HAPPY ? Mood.SAD : Mood.HAPPY;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        Mood mood = s_idToMood[_tokenId];
        bool isHappy = mood == Mood.HAPPY;
        bytes memory nftMetaData = bytes(
            abi.encodePacked(
                '{"name":"',
                name(),
                '",',
                '"description":"NFT That reflects owner\'s mood",',
                '"attributes":[{"trait_type":"mood","value":"',
                isHappy ? "100" : "0",
                '"},{"trait_type":"moodState","value":"',
                isHappy ? "Happy" : "Sad",
                '"}],',
                '"image":"',
                isHappy ? s_happySVGEncodedURI : s_sadSVGEncodedURI,
                '"}'
            )
        );
        return string.concat(_baseURI(), Base64.encode(nftMetaData));
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function getMood(uint256 _tokenId) public view returns (Mood) {
        return s_idToMood[_tokenId];
    }

    modifier onlyOwner(uint256 _tokenId) {
        if (msg.sender != ownerOf(_tokenId)) {
            revert MoodNFT__OnlyOwnerCanPerformThisOperation();
        }
        _;
    }
}
