const { ethers } = require("hardhat");

async function main() {
  const ERC721Contracts = await ethers.getContractFactory("NftContract");
  const deployedERC721Contracts  = await ERC721Contracts.deploy();
  await deployedERC721Contracts.deployed();
  
  console.log(
    "deployed Contract Address:",deployedERC721Contracts.address );
}
main()
 .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});

