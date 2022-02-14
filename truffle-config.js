require('dotenv').config({ path: `.env.${process.env.ETHNW}` })
require('babel-register')
require('babel-polyfill')
const config = require('./config.json')
const HDWalletProvider = require('truffle-hdwallet-provider')

console.log('========================================')
console.log("Ethereum Network:", process.env.ETHNW)
console.log('========================================')

module.exports = {
  plugins: ["solidity-coverage", "truffle-plugin-verify"],
  compilers: {
    solc: {
      version: config.compilers.solc,
      settings: {
        optimizer: config.compilers.optimizer,
        evmVersion: config.compilers.evmVersion,
      },
    }
  },
  networks: {
    development: {
      host: '127.0.0.1',
      port: 62743,
      network_id: '*'
    },
    coverage: {
      host: 'localhost',
      network_id: '*', // eslint-disable-line camelcase
      port: 8555,
      gas: 0xfffffffffff,
      gasPrice: 0x01,
      disableConfirmationListener: true,
    },
    testnet: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://data-seed-prebsc-1-s1.binance.org:8545`),
      network_id: 97,
      timeoutBlocks: 1000000000,
      networkCheckTimeout: 1000000000,
      from: process.env.DEPLOYLER,
      skipDryRun: true
    },
    bsc: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://bsc-dataseed.binance.org/`),
      network_id: 56,
      confirmations: 10,
      timeoutBlocks: 200,
      from: process.env.DEPLOYLER,
      skipDryRun: true
    }
  },
  api_keys: {
    bscscan: process.env.BSCSCAN_API_KEY,
  },
}
