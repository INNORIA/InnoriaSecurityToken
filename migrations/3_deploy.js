const InnoriaSecurityToken = artifacts.require('./InnoriaSecurityToken.sol');
const Extension = artifacts.require('./InnoriaSecurityTokenValidator.sol');
const ERC1820Registry = artifacts.require('IERC1820Registry');

const CERTIFICATE_SIGNER = process.env.CERTSIGNER;
const controller = process.env.CONTROLLER;

const partition1 = '0x7265736572766564000000000000000000000000000000000000000000000000'; // reserved in hex
const partition2 = '0x6973737565640000000000000000000000000000000000000000000000000000'; // issued in hex
const partition3 = '0x6c6f636b65640000000000000000000000000000000000000000000000000000'; // locked in hex
const partitions = [partition1, partition2, partition3];

const ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";

const ERC1400_TOKENS_VALIDATOR = "InnoriaSecurityTokenValidator";

const CERTIFICATE_VALIDATION_NONE = 0;
const CERTIFICATE_VALIDATION_NONCE = 1;
const CERTIFICATE_VALIDATION_SALT = 2;

module.exports = async function (deployer, network, accounts) {
  if (network == "test") return; // test maintains own contracts

  //>> Deploy main token and extension

  await deployer.deploy(Extension);
  const extension = await Extension.deployed();
  console.log('\n   > InnoriaSecurityTokenValidator deployment: Success -->', extension.address);

  await deployer.deploy(InnoriaSecurityToken, 'InnoriaSecurityToken', 'IST', 1, [controller], partitions, extension.address, controller, CERTIFICATE_SIGNER, CERTIFICATE_VALIDATION_SALT);
  const tokenInstance = await InnoriaSecurityToken.deployed();
  console.log('\n   > InnoriaSecurityToken token deployment with automated extension setup: Success -->', tokenInstance.address);

  //<< Deploy main token and extension
};
