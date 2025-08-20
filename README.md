# Mega-Nft-ultimate-
Mega nft 
# 🌐 Ultimate NFT Project

This is a full NFT project repository, designed for GitHub only.

---

## 🚀 Features

- NFT Minting (ERC-721 Smart Contract)
- NFT Marketplace
- Wallet Integration (MetaMask)
- IPFS Storage for NFT metadata
- Compatible with Ethereum & Polygon
- Fully structured for GitHub copy-paste

---

## 🛠 Technologies

- Frontend: React.js
- Smart Contract: Solidity
- Framework: Hardhat
- Libraries: Ethers.js / Web3.js
- Storage: IPFS

---

## 📂 Folder Structure

---

## 3️⃣ NFT Smart Contract Example (NFT.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721URIStorage, Ownable {
    uint public tokenCount;

    constructor() ERC721("UltimateNFT", "UNFT") {}

    function mint(string memory _tokenURI) public returns (uint) {
        tokenCount++;
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return tokenCount;
    }
}

const hre = require("hardhat");

async function main() {
    const NFT = await hre.ethers.getContractFactory("NFT");
    const nft = await NFT.deploy();
    await nft.deployed();
    console.log("NFT deployed to:", nft.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});

const hre = require("hardhat");

async function main() {
    const NFT = await hre.ethers.getContractFactory("NFT");
    const nft = await NFT.deploy();
    await nft.deployed();
    console.log("NFT deployed to:", nft.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
import { useState } from "react";
import { ethers } from "ethers";
import NFT from "./NFT.json";

function App() {
    const [currentAccount, setCurrentAccount] = useState(null);
    const [tokenURI, setTokenURI] = useState("");

    async function connectWallet() {
        const [account] = await window.ethereum.request({ method: "eth_requestAccounts" });
        setCurrentAccount(account);
    }

    async function mintNFT() {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract("NFT_CONTRACT_ADDRESS", NFT.abi, signer);
        const tx = await contract.mint(tokenURI);
        await tx.wait();
        alert("NFT Minted!");
    }

    return (
        <div>
            <button onClick={connectWallet}>Connect Wallet</button>
            <input value={tokenURI} onChange={e => setTokenURI(e.target.value)} placeholder="Enter NFT URL"/>
            <button onClick={mintNFT}>Mint NFT</button>
        </div>
    );
}

export default App;
