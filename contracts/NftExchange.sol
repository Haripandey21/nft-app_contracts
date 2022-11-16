// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./NftContract.sol";

contract NftExchange {
    function transferNfts(
        address _contractAddress,
        uint256 tokenID,
        address _to,
        uint256 _Amount
    ) public payable {
        address seller = ERC721(_contractAddress).ownerOf((tokenID));
        payable(seller).transfer(_Amount);
        ERC721(_contractAddress).safeTransferFrom(
            ERC721(_contractAddress).ownerOf(tokenID),
            _to,
            tokenID
        );
    }
}
