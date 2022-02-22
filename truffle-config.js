require('dotenv').config({ path: `.env.${process.env.ETHNET}` })
require('babel-register')
require('babel-polyfill')
const config = require('./config.json')
const HDWalletProvider = require('truffle-hdwallet-provider')

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
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://data-seed-prebsc-2-s2.binance.org:8545/`),
      network_id: 97,
      // gas: 10055186,
      // gasPrice: 10000000000,
      timeoutBlocks: 1000000000,
      networkCheckTimeout: 1000000000,
      from: process.env.DEPLOYLER,
      skipDryRun: true
    },
    bsc: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://bsc-dataseed.binance.org/`),
      network_id: 56,
      confirmations: 2,
      timeoutBlocks: 200,
      from: process.env.DEPLOYLER,
      skipDryRun: true
    }
  },
  api_keys: {
    bscscan: process.env.BSCSCAN_API_KEY,
  },
}
