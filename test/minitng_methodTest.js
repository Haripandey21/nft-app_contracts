const { expect } = require("chai");
const hre = require("hardhat");
let ERC721Contracts

describe("deployment testing...", function () {
  beforeEach(async () => {
    [addr1, addr2, addr3] = await hre.ethers.getSigners();
     ERC721Contracts = await ethers.getContractFactory("NftContract");
    deployedERC721Contracts = await ERC721Contracts.deploy();
    await deployedERC721Contracts.deployed();
  });
  it("minting testing ... ", async () => {
 
    await deployedERC721Contracts.safeMint("Nft_1");
   let owner=await deployedERC721Contracts.ownerOf(1)
   expect (addr1.address).to.equal(owner)
   //console.log(owner)
  });
})