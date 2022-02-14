// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

import "../Extensions/Extensions.sol";

abstract contract IERC1400TokensValidatorExtended is IExtensionTypes {

    function retrieveTokenSetup(address token) external virtual view returns (CertificateValidation, bool, bool, bool, bool, address[] memory);

    function spendableBalanceOfByPartition(address token, bytes32 partition, address account) external virtual view returns (uint256);

    function isAllowlisted(address token, address account) public virtual view returns (bool);

    function isBlocklisted(address token, address account) public virtual view returns (bool);
}