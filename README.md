
1. NFT Collection 
2. Each NFT to have a "rarity" 
3. People pay to mint random dogs 
<br />
Boilerplate: https://github.com/smartcontractkit/full-blockchain-solidity-course-js#lesson-9-hardhat-smart-contract-lottery 

<br /><br />

Flow: 
<br />
yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers @nomiclabs/hardhat-etherscan @nomiclabs/hardhat-waffle chai ethereum-waffle hardhat hardhat-contract-sizer hardhat-deploy hardhat-gas-reporter prettier prettier-plugin-solidity solhint solidity-coverage dotenv
<br />
yarn hardhat 
<br />
create empty hardhat.config.js
<br />
update solidity version in hardhat.config.js (^0.8.7)
<br />
mkdir contracts
<br />
mkfile in /contracts: RandomIpfsNft.sol
<br />
yarn hardhat compile
<br />
npm install --save-dev @openzeppelin/contracts 
<br />






<br /><br />

Troubleshooting: 

<br />

err: hardhat@2.9.7: The engine "node" is incompatible with this module. Expected version "^12.0.0 || ^14.0.0 || ^16.0.0". Got "18.0.0"
<br />
solution: https://stackoverflow.com/questions/56617209/the-engine-node-is-incompatible-with-this-module 
<br />
wisdom: yarn install --ignore-engines

<br /><br />

err: You are using a version of Node.js that is not supported by Hardhat, and it may work incorrectly, or not work at all.
<br />
Please, make sure you are using a supported version of Node.js.
<br />
To learn more about which versions of Node.js are supported go to https://hardhat.org/nodejs-versions 
<br />
solution: uninstall node (https://www.imymac.com/powermymac/uninstall-node-mac.html) and reinstall node lts (https://nodejs.org/en/) 

<br /><br />