const { expect } = require("chai");
const hre = require("hardhat");
let NftContract
let NftExchange

describe("nfts transfer testing .........", function () {
  beforeEach(async () => {
    [addr1, addr2, addr3] = await hre.ethers.getSigners();
    console.log("addr2 : ",addr2.address);
    NftContract = await ethers.getContractFactory("NftContract");
    deployedNftContract = await NftContract.deploy();
    await deployedNftContract.deployed();

    NftExchange = await ethers.getContractFactory("NftExchange");
    deployedNftExchange = await NftExchange.deploy();
    await deployedNftExchange.deployed(); 

    await deployedNftContract.safeMint("Nft_1");  
    await deployedNftContract.safeMint("Nft_2"); 
  });


  it("minting ..... ", async () => {
   
   let owner=await deployedNftContract.ownerOf(1)
   expect (addr1.address).to.equal(owner)
   console.log("owner of Nft1 : ",owner) 
  });


  it("approval..... ", async () => {

    await deployedNftContract.connect(addr1).approve(deployedNftContract.address,1);
    let approvedAddr=await deployedNftContract.connect(addr1).getApproved(1);
    console.log("deployed address : ",deployedNftContract.address)
    console.log("approved address :",approvedAddr)
   }); 

   it("transfer..... ", async () => {


    let oldOwner= await deployedNftContract.ownerOf(1); 
    console.log("oldOwner :",oldOwner) 

    await deployedNftContract.connect(addr1).approve(deployedNftExchange.address,1);

    await deployedNftExchange.connect(addr1).
    transferNfts(deployedNftContract.address,1,addr2.address,10,
        {value : 10});
     let newOwner= await deployedNftContract.ownerOf(1); 
     console.log("newOwner :",newOwner)
   });  
   
})
