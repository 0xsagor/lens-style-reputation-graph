# On-chain Reputation System (Lens-style)

A professional-grade implementation for the "Social Layer" of Web3. This repository moves social capital from centralized databases to the blockchain. By representing profiles and social actions as composable NFTs, users own their data and their "Reputation Score," which can be used to unlock DeFi loans, DAO governance power, or premium content access.

## Core Features
* **Profile NFTs:** The core identity unit containing handles, metadata, and link to followers.
* **Follow Modules:** Programmable logic for following (e.g., pay-to-follow, follow-only-if-holding-token).
* **Reference Modules:** Logic for interacting with content (Mirrors/Comments) with built-in attribution.
* **Flat Architecture:** Single-directory layout for the Profile Registry, Publication Engine, and Follow logic.



## Logic Flow
1. **Mint:** User mints a Profile NFT with a unique handle (e.g., `nazrul.lens`).
2. **Post:** User publishes a "Publication" (Article, Image, or Video) which is stored via IPFS/Arweave.
3. **Follow:** Another user follows the profile; a "Follow NFT" is minted to represent the relationship.
4. **Aggregate:** 3rd-party apps calculate a "Reputation Score" based on the number of high-quality followers and mirrors the profile has.

## Setup
1. `npm install`
2. Deploy `LensProfile.sol` and `PublicationHub.sol`.
