module.exports = {
  configureYulOptimizer: true,
  compileCommand:
    "node --max-old-space-size=4096 ../node_modules/.bin/truffle compile --network coverage",
  skipFiles: [],
  copyPackages: [],
  mocha: {
    enableTimeouts: false,
    before_timeout: 0
  }
};
