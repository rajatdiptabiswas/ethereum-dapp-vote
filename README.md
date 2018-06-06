# EtherElect ĐApp
A decentralized voting website that keeps track of the votes to each candidate using an Ethereum smart contract.

![screenshot](demo.png)
*Screenshot of the website in action*

### Prerequisites

* [Node.js](https://nodejs.org/en/), a JavaScript runtime
* [npm](https://www.npmjs.com), a package manager for JavaScript
* [solc](https://www.npmjs.com/package/solc), a Solidity compiler
* [web3.js](https://github.com/ethereum/web3.js/), an Ethereum Javascript API
* [Ganache](https://github.com/trufflesuite/ganache-cli), a personal blockchain for Ethereum development

### Installing

#### Node.js and npm  
Go to https://nodejs.org/en/ to download the package or use Homebrew to install
```
brew install node
```
Check whether node and npm installed correctly using
```
node -v
npm -v
```

#### solc
```
npm install solc
```

#### web3.js
```
npm install web3@0.20.6
```

#### Ganache CLI
```
npm install ganache-cli
```

###### Note: npm installs to the current directory in the terminal

## Running the app

Open a terminal window and locate to the current directory and start Ganache to implement a personal blockchain
```
node_modules/.bin/ganache-cli
```
Open another terminal window and open the node console using
```
node
```
Compile the Solidity file ```voting.sol``` in the node console using
```
> code = fs.readFileSync('voting.sol').toString()
> solc = require('solc')
> compiledCode = solc.compile(code)
```
Deploy the contract in the node console using
```
> byteCode = compiledCode.contracts[':Voting'].bytecode;
> deployedContract = votingContract.new(['Kim Jong-un','Donald Trump','Vladimir Putin'],{data: byteCode, from: web3.eth.accounts[0], gas: 4700000});
```

If changes have been made in the ```voting.sol``` file, update ```abi = JSON.parse()``` in ```index.js``` file with ```> compiledCode.contracts[':Voting'].interface```
```
abi = JSON.parse(compiledCode.contracts[':Voting'].interface)
```

The address of ```votingContract.at(address)``` will change with every ```ganache-cli``` restart and should be replaced with ```> deployedContract.address```
```
contractInstance = votingContract.at('0x3b08aa4681a7b4757287d9e7afef9fecbf51f782');
```

###### Note: ```> code``` refers to code that needs to be run in the node console

## Authors

* **Rajat Dipta Biswas** - *Initial work*

See also the list of [contributors](https://github.com/rajatdiptabiswas/ethereum-dapp-vote/graphs/contributors) who participated in this project.

## Acknowledgments

* [Zastrin](https://www.zastrin.com)
* FreeCodeCamp - [A guide to developing an Ethereum decentralized voting application](https://medium.freecodecamp.org/developing-an-ethereum-decentralized-voting-application-a99de24992d9)
