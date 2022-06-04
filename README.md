
1. NFT Collection 
2. Each NFT to have a "rarity" 
3. People pay to mint random dogs 
<br /><br />
Boilerplate: https://github.com/smartcontractkit/full-blockchain-solidity-course-js#lesson-9-hardhat-smart-contract-lottery 

<br /><br /><br />

Flow: 
<br /><br />
yarn add --dev @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers @nomiclabs/hardhat-etherscan @nomiclabs/hardhat-waffle chai ethereum-waffle hardhat hardhat-contract-sizer hardhat-deploy hardhat-gas-reporter prettier prettier-plugin-solidity solhint solidity-coverage dotenv
<br /><br />
yarn hardhat 
<br /><br />
create empty hardhat.config.js
<br /><br />
update solidity version in hardhat.config.js (^0.8.7)
<br /><br />
mkdir contracts
<br /><br />
mkfile in /contracts: RandomIpfsNft.sol
<br /><br />
yarn hardhat compile
<br /><br />
npm install --save-dev @openzeppelin/contracts 
<br /><br />






<br /><br /><br />

Troubleshooting: 

<br /><br />

err: hardhat@2.9.7: The engine "node" is incompatible with this module. Expected version "^12.0.0 || ^14.0.0 || ^16.0.0". Got "18.0.0"
<br /><br />
solution: https://stackoverflow.com/questions/56617209/the-engine-node-is-incompatible-with-this-module 
<br /><br />
wisdom: yarn install --ignore-engines

<br /><br /><br />

err: You are using a version of Node.js that is not supported by Hardhat, and it may work incorrectly, or not work at all.
<br /><br />
Please, make sure you are using a supported version of Node.js.
<br /><br />
To learn more about which versions of Node.js are supported go to https://hardhat.org/nodejs-versions 
<br /><br />
solution: uninstall node (https://www.imymac.com/powermymac/uninstall-node-mac.html) and reinstall node lts (https://nodejs.org/en/) 

<br /><br /><br />