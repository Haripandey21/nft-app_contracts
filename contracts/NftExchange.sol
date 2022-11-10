// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

import './NftContract.sol';
contract NftExchange {
     
    function transferNfts (address _contractAddress,uint tokenID,address _to,uint _Amount)public payable
    {


    ERC721(_contractAddress).safeTransferFrom(ERC721(_contractAddress).ownerOf(tokenID),_to,tokenID);



    }


}

