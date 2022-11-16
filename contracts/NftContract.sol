// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NftContract is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter internal _tokenIdCounter;

    struct tokenInfo {
        uint256 tokenID;
        string tokenURI;
    }
    // struct array for returning data
    tokenInfo[] internal tokenInfoArray;

    constructor() ERC721("Blocks-eater", "BE") {}

    function safeMint(string memory uri) public {
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function getAllTokens() public view returns (tokenInfo[] memory) {
        // new array initialization
        tokenInfo[] memory returnDataArray = new tokenInfo[](_tokenIdCounter.current());
        for (uint256 i = 0; i < _tokenIdCounter.current(); i++) {
            tokenInfo memory dataStruct = tokenInfo(i + 1, tokenURI(i + 1));
            returnDataArray[i] = dataStruct;
        }
        return returnDataArray;
    }
}


