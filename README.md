# Robinhood Board

A simple 10,000-block crypto-native board built for Robinhood Chain.

## V2 — Robinhood Chain Testnet

- 10,000 fixed blocks
- ERC-721 ownership
- Lazy minting when a block is purchased
- Wallet connection
- Multi-block testnet purchases
- 0.01 ETH testnet price per block
- Robinhood Chain Testnet configuration

### Testnet

- Chain ID: 46630
- RPC: https://rpc.testnet.chain.robinhood.com
- Explorer: https://explorer.testnet.chain.robinhood.com
- Faucet: https://faucet.testnet.chain.robinhood.com

## Run

```bash
npm install
cp .env.example .env
npm run compile
npm run deploy:testnet
```

Copy the deployed contract address into `frontend/index.html` as `CONTRACT_ADDRESS`, then:

```bash
npx serve frontend
```

Use a throwaway testnet wallet. Never commit `.env` or a real private key.

## Contract

`contracts/RobinhoodBoard.sol` represents blocks 1–10,000 as ERC-721 NFTs. Blocks are minted only when purchased.

## Roadmap

V3: synchronize ownership from blockchain events so the board stays correct after refresh, then add metadata/image uploads and a secondary marketplace.

This is testnet software and has not been audited. Do not use it for real funds.
