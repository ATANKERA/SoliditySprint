# Example-Solidity-Sprint

## Getting Started

To build, test, and deploy the example smart contract, we will use Hardhat, an Ethereum development environment. Make sure you have [npm](https://nodejs.org/en/download/) installed before executing the following commands.

First clone the repository and enter the directory.
```
$ git clone https://github.com/404-DAO/Example-Solidity-Sprint.git
$ cd "Example-Solidity-Sprint"
```

You have your choice of development frameworks for this sprint. The recommended tools are either Hardhat or Foundry.
### Foundry

Foundry is a command-line tool independent of NPM, meaning you must install it individually on your machine. Instructions on how to do so can be found
on their website [getFoundry.sh](https://getFoundry.sh)

`curl -L https://foundry.paradigm.xyz | bash`

It contains tools you may find useful during this challenge including 
`forge` - A testing-framework for smart-contracts in Solidity
`cast` - A suite of command-line tools for common things in solidity
`anvil` - a chain-forking CLI-tool similar to ganache

We recommend `forge` and `cast` due to their fast runtime and excellent documentation. Once foundry is installed, no further configuration should be necesarry. Any code found in either `contracts`, `test`, or `script` will be compiled by using the `forge build` command.

Foundry has its own scripting and deployment library as well which you can read up on 


### Hardhat
Install the necessary dependencies
```
$ npm i
```

Compile the ExampleSoliditySprint2022 contract
```
$ npx hardhat compile
```

Run associated tests
```
$ npx hardhat test
```

Deploy to Goerli
```
$ npx hardhat run scripts/deploy.js --network Goerli
```

To deploy your contract or transaction you will need to place your private key in a `.env` file alongside your `hardhat.config.js` file under the variable `GOERLI_PRIVATE_KEY=[key]`


## Preparation

[IF YOU NEED GOERLI ETH, ASK IN THE DISCORD](https://discord.gg/G7ZV5kFmd2) or [visit this link](https://goerlifaucet.com/)

Play around with the contract [using Etherscan](https://goerli.etherscan.io/address/0xcfd9741867bad2f94c8bfb91518066436cbe6a20#writeContract) or locally by running tests.

Try to complete `f1`. If you're testing locally using hardhat, [start here](https://github.com/404-DAO/Example-Solidity-Sprint/blob/main/test/ExampleSoliditySprint2022.js#L127).

**Note:** Each transaction sent to the network incurs gas cost, consider this when completing `f1`.



## Educational Materials

* [Build and Deploy Smart Contracts using Hardhat](https://www.youtube.com/watch?v=GBc3lBrXEBo&ab_channel=PatrickCollins)
* [Crypto Zombies](https://cryptozombies.io/)
* [Speedrun Ethereum](https://speedrunethereum.com/)
