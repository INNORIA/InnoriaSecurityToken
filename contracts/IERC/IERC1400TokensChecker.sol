// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

/**
 * @title IERC1400TokensChecker
 * @dev IERC1400TokensChecker interface
 */
interface IERC1400TokensChecker {

  // function canTransfer(
  //   bytes calldata payload,
  //   address operator,
  //   address from,
  //   address to,
  //   uint256 value,
  //   bytes calldata data,
  //   bytes calldata operatorData
  // ) external view returns (byte, bytes32);

  function canTransferByPartition(
    bytes calldata payload,
    bytes32 partition,
    address operator,
    address from,
    address to,
    uint256 value,
    bytes calldata data,
    bytes calldata operatorData
    ) external view returns (bytes1, bytes32, bytes32);

}
