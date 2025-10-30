
# 🗳️ Voting DApp on Celo

A simple **decentralized voting application** built with **Solidity** and deployed on the **Celo Blockchain (Sepolia Testnet)**.  
This project demonstrates how blockchain can ensure **fair, transparent, and tamper-proof voting**.

## 📜 Project Description

Voting DApp allows users to **vote for their favorite candidates** in a transparent way.  
Each voter can vote **only once**, and every vote is **recorded on-chain**, making it **immutable and verifiable**.

The project is designed for **beginners** learning Solidity and Celo smart contract development.

## ⚙️ What It Does

1. The contract owner deploys the smart contract with a list of candidates.  
2. Users connect their wallet and vote for their preferred candidate.  
3. Each address can vote only once.  
4. The owner can close the voting when it’s over.  
5. Results can be viewed directly from the blockchain.

## 🌟 Features

- 🧠 **Simple & Beginner-Friendly:** Easy to understand Solidity structure.  
- 🔒 **One-Vote Rule:** Each wallet address can only vote once.  
- ⛓️ **On-Chain Transparency:** All votes are publicly verifiable.  
- 🪙 **Deployed on Celo Sepolia:** Uses Celo’s testnet for a smooth developer experience.  
- 👨‍💼 **Owner Privileges:** Only the contract deployer can end the voting phase.

## 📄 Smart Contract

- **Language:** Solidity `^0.8.20`  
- **Framework:** Remix / Hardhat compatible  
- **Network:** Celo Sepolia Testnet  
- **Deployed Transaction:**  
  👉 [View on Blockscout](https://celo-sepolia.blockscout.com/address/0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8)

## 💻 Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotKing {
    // Predefined candidates (no user input needed)
    string[3] public candidates = ["Alice", "Bob", "Charlie"];

    // Store votes for each candidate
    mapping(string => uint256) public votes;

    // Track if an address has voted
    mapping(address => bool) public hasVoted;

    // Event for logging votes
    event Voted(address indexed voter, string candidate);

    // Function to vote for a candidate
    function vote(uint8 candidateIndex) public {
        require(candidateIndex < candidates.length, "Invalid candidate");
        require(!hasVoted[msg.sender], "You have already voted");

        string memory candidate = candidates[candidateIndex];
        votes[candidate] += 1;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, candidate);
    }

    // Get total votes for all candidates
    function getAllVotes() public view returns (uint256[3] memory) {
        return [
            votes[candidates[0]],
            votes[candidates[1]],
            votes[candidates[2]]
        ];
    }

    // Get current winner
    function getWinner() public view returns (string memory winner) {
        uint256 highest = 0;
        winner = candidates[0];

        for (uint8 i = 0; i < candidates.length; i++) {
            if (votes[candidates[i]] > highest) {
                highest = votes[candidates[i]];
                winner = candidates[i];
            }
        }
    }
}

````

## 🚀 How to Run Locally

1. **Clone the repository**

   ```bash
   git clone https://github.com/BikramMondal5/celoTIU.git
   cd celoTIU
   ```

2. **Open Remix IDE**

   * Visit [Remix IDE](https://remix.ethereum.org)
   * Paste your smart contract code inside a new file (`VotingDApp.sol`)

3. **Compile & Deploy**

   * Select **Solidity Compiler** → version `0.8.20`
   * Deploy using **Injected Web3** to connect your **Celo wallet**

4. **Interact with the Contract**

   * Call `vote()` with the candidate index.
   * Use `getCandidate()` to view results.

## 🧩 Future Enhancements

* 🖥️ Build a React front-end with **Celo Composer** or **Ethers.js**
* 🧾 Add voter registration and candidate management
* 📊 Display live voting stats on UI
* 🔐 Integrate identity verification (optional)


## 🙌 Acknowledgments

* [Celo Blockchain](https://celo.org/) for providing eco-friendly infrastructure
* [Remix IDE](https://remix.ethereum.org/) for easy smart contract testing
* [Blockscout](https://blockscout.com/) for transparent transaction viewing


> 💡 **Pro Tip:** Start small — experiment, break things, and learn how decentralized apps work under the hood.

### 🧠 Made with ❤️ by Bikram Mondal | BikramMondal5

``
