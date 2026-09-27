require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports={
  solidity:"0.8.24",
  networks:{
    robinhoodTestnet:{
      url:process.env.RH_RPC_URL||"https://rpc.testnet.chain.robinhood.com",
      chainId:46630,
      accounts:process.env.PRIVATE_KEY?[process.env.PRIVATE_KEY]:[]
    }
  }
};
