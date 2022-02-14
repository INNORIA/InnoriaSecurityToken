// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

import "../Extensions/ERC1400TokensValidator.sol";

/**
 @notice Interface to the Minterrole contract
*/
interface IMinterMock {
  function renounceMinter() external;
}

contract ERC1400TokensValidatorMock is ERC1400TokensValidator {

  function renounceMinter(address token) external onlyTokenController(token) {
    IMinterMock(token).renounceMinter();
  }

}