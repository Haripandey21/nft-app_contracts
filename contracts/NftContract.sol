// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NftContract is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter internal _tokenIdCounter;
    struct tokenInfo {
        uint256 tokenID;
        string tokenURI;
    }
    tokenInfo[] internal tokenInfoArray;
    constructor() ERC721("Blocks-eater", "BE") {}

    function safeMint(string memory uri) public {
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
    }
    
    function getAllTokens() public view returns (tokenInfo[] memory) {
        tokenInfo[] memory returnDataArray = new tokenInfo[](
            _tokenIdCounter.current()
        );
        for (uint256 i = 0; i < _tokenIdCounter.current(); i++) {
            tokenInfo memory dataStruct = tokenInfo(i + 1, tokenURI(i + 1));
            returnDataArray[i] = dataStruct;
        }
        return returnDataArray;
    }
}
