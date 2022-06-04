
1. NFT Collection 
2. Each NFT to have a "rarity" 
3. People pay to mint random dogs 

Boilerplate: https://github.com/smartcontractkit/full-blockchain-solidity-course-js#lesson-9-hardhat-smart-contract-lottery 

yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers @nomiclabs/hardhat-etherscan @nomiclabs/hardhat-waffle chai ethereum-waffle hardhat hardhat-contract-sizer hardhat-deploy hardhat-gas-reporter prettier prettier-plugin-solidity solhint solidity-coverage dotenv

Troubleshooting: 

err: hardhat@2.9.7: The engine "node" is incompatible with this module. Expected version "^12.0.0 || ^14.0.0 || ^16.0.0". Got "18.0.0"
solution: https://stackoverflow.com/questions/56617209/the-engine-node-is-incompatible-with-this-module 
wisdom: yarn install --ignore-engines