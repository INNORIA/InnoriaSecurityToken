/**
 * Credit to https://github.com/Consensys/UniversalToken
 * Source code implement base on UniversalToken (implementation of ERC1400 with various extensions)
 */
// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

import "./ERC1400.sol";

import "../Extensions/Extensions.sol";

/**
 * @title ERC1400HoldableCertificateNonceToken
 * @dev Holdable ERC1400 with nonce-based certificate controller logic
 */
contract ERC1400HoldableCertificateToken is ERC1400, IExtensionTypes {

  /**
   * @dev Initialize ERC1400 + initialize certificate controller.
   * @param tokenName Name of the token.
   * @param tokenSymbol Symbol of the token.
   * @param tokenGranularity Granularity of the token.
   * @param tokenControllers Array of initial controllers.
   * @param defaultPartitions Partitions chosen by default, when partition is
   * not specified, like the case ERC20 tranfers.
   * @param extension Address of token extension.
   * @param newOwner Address whom contract ownership shall be transferred to.
   * @param certificateSigner Address of the off-chain service which signs the
   * conditional ownership certificates required for token transfers, issuance,
   * redemption (Cf. CertificateController.sol).
   * @param certificateActivated If set to 'true', the certificate controller
   * is activated at contract creation.
   */
  constructor(
    string memory tokenName,
    string memory tokenSymbol,
    uint256 tokenGranularity,
    address[] memory tokenControllers,
    bytes32[] memory defaultPartitions,
    address extension,
    address newOwner,
    address certificateSigner,
    CertificateValidation certificateActivated
  )
    ERC1400(tokenName, tokenSymbol, tokenGranularity, tokenControllers, defaultPartitions)
  {
    if(extension != address(0)) {
      Extension(extension).registerTokenSetup(
        address(this), // token
        certificateActivated, // certificateActivated
        true, // allowlistActivated
        true, // blocklistActivated
        true, // granularityByPartitionActivated
        true, // holdsActivated
        tokenControllers // token controllers
      );

      if(certificateSigner != address(0)) {
        Extension(extension).addCertificateSigner(address(this), certificateSigner);
      }

      _setTokenExtension(extension, ERC1400_TOKENS_VALIDATOR, true, true, true);
    }

    if(newOwner != address(0)) {
      transferOwnership(newOwner);
    }
  }

  /************************************** Transfer Validity ***************************************/
  /**
   * @dev Know the reason on success or failure based on the EIP-1066 application-specific status codes.
   * @param partition Name of the partition.
   * @param to Token recipient.
   * @param value Number of tokens to transfer.
   * @param data Information attached to the transfer, by the token holder. [CONTAINS THE CONDITIONAL OWNERSHIP CERTIFICATE]
   * @return ESC (Ethereum Status Code) following the EIP-1066 standard.
   * @return Additional bytes32 parameter that can be used to define
   * application specific reason codes with additional details (for example the
   * transfer restriction rule responsible for making the transfer operation invalid).
   * @return Destination partition.
   */
  function canTransferByPartition(bytes32 partition, address to, uint256 value, bytes calldata data)
    external
    view
    returns (bytes1, bytes32, bytes32)
  {
    return ERC1400._canTransfer(
      _replaceFunctionSelector(this.transferByPartition.selector, msg.data), // 0xf3d490db: 4 first bytes of keccak256(transferByPartition(bytes32,address,uint256,bytes))
      partition,
      msg.sender,
      msg.sender,
      to,
      value,
      data,
      ""
    );
  }
  /**
   * @dev Know the reason on success or failure based on the EIP-1066 application-specific status codes.
   * @param partition Name of the partition.
   * @param from Token holder.
   * @param to Token recipient.
   * @param value Number of tokens to transfer.
   * @param data Information attached to the transfer. [CAN CONTAIN THE DESTINATION PARTITION]
   * @param operatorData Information attached to the transfer, by the operator. [CONTAINS THE CONDITIONAL OWNERSHIP CERTIFICATE]
   * @return ESC (Ethereum Status Code) following the EIP-1066 standard.
   * @return Additional bytes32 parameter that can be used to define
   * application specific reason codes with additional details (for example the
   * transfer restriction rule responsible for making the transfer operation invalid).
   * @return Destination partition.
   */
  function canOperatorTransferByPartition(bytes32 partition, address from, address to, uint256 value, bytes calldata data, bytes calldata operatorData)
    external
    view
    returns (bytes1, bytes32, bytes32)
  {
    return ERC1400._canTransfer(
      _replaceFunctionSelector(this.operatorTransferByPartition.selector, msg.data), // 0x8c0dee9c: 4 first bytes of keccak256(operatorTransferByPartition(bytes32,address,address,uint256,bytes,bytes))
      partition,
      msg.sender,
      from,
      to,
      value,
      data,
      operatorData
    );
  }
  /**
   * @dev Replace function selector
   * @param functionSig Replacement function selector.
   * @param payload Payload, where function selector needs to be replaced.
   */
  function _replaceFunctionSelector(bytes4 functionSig, bytes memory payload) internal pure returns(bytes memory) {
    bytes memory updatedPayload = new bytes(payload.length);
    for (uint i = 0; i<4; i++){
      updatedPayload[i] = functionSig[i];
    }
    for (uint j = 4; j<payload.length; j++){
      updatedPayload[j] = payload[j];
    }
    return updatedPayload;
  }
  /************************************************************************************************/

}