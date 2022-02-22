// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

/**
 * @notice Interface to the extension types
 */
interface IExtensionTypes {
  enum CertificateValidation {
    None,
    NonceBased,
    SaltBased
  }
}

/**
 * @notice Interface to the extension contract
 */
abstract contract Extension is IExtensionTypes {
  function registerTokenSetup(
    address token,
    CertificateValidation certificateActivated,
    bool allowlistActivated,
    bool blocklistActivated,
    bool granularityByPartitionActivated,
    bool holdsActivated,
    address[] calldata operators
  ) external virtual;

  function addCertificateSigner(
    address token,
    address account
  ) external virtual;
}

interface IERC1400Extended {

    function granularity() external view returns(uint256);
    
    function owner() external view returns (address);

    function controllers() external view returns (address[] memory);

    function totalPartitions() external view returns (bytes32[] memory);

    function getDefaultPartitions() external view returns (bytes32[] memory);

    function totalSupplyByPartition(bytes32 partition) external view returns (uint256);
}