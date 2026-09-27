const hre=require("hardhat");

async function main(){
  const [deployer]=await hre.ethers.getSigners();
  const treasury=process.env.TREASURY_ADDRESS||deployer.address;
  const price=hre.ethers.parseEther("0.01");
  const baseURI="";
  console.log("Deploying from:",deployer.address);
  const Board=await hre.ethers.getContractFactory("RobinhoodBoard");
  const board=await Board.deploy(price,baseURI,treasury);
  await board.waitForDeployment();
  console.log("RobinhoodBoard deployed to:",await board.getAddress());
}
main().catch(e=>{console.error(e);process.exitCode=1});
