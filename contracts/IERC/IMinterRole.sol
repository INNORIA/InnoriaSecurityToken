// SPDX-License-Identifier: Apache-2.0
/**
 * @notice Interface to the MinterRole contract
 */
pragma solidity ^0.8.6;
interface IMinterRole {
  function isMinter(address account) external view returns (bool);
}