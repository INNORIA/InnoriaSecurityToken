/********************************************************************************/
/*                     ______         ______         ________                   */
/*                    |      \       /      \       |        \                  */
/*                     \██████      |  ██████\       \████████                  */
/*                      | ██        | ██___\██         | ██                     */
/*                      | ██         \██    \          | ██                     */
/*                      | ██         _\██████\         | ██                     */
/*                     _| ██_       |  \__| ██         | ██                     */
/*                    |   ██ \       \██    ██         | ██                     */
/*                     \██████        \██████           \██                     */
/*                                                                              */
/*                              INNORIA SECURITY TOKEN                          */
/*                          The road to become a tokenomics                     */
/*                                                                              */
/*  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~  .  ~   */
/*                                                                              */
/*    Website:    https://www.innoria.com/                                      */
/*    Email:      smart.contract@innoria.com                                    */
/*    Whitepaper: https://www.innoria.com/security-tokens                       */
/*                                                                              */
/********************************************************************************/

// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.6;

import { ERC1400HoldableCertificateToken } from "./ERC1400Base/ERC1400HoldableCertificateToken.sol";


contract InnoriaSecurityToken is ERC1400HoldableCertificateToken {
    constructor(string memory name,
    string memory symbol,
    uint256 granularity,
    address[] memory controllers,
    bytes32[] memory defaultPartitions,
    address extension,
    address newOwner,
    address certificateSigner,
    CertificateValidation certificateActivated) 
    ERC1400HoldableCertificateToken(name, symbol, granularity, controllers, defaultPartitions, extension, newOwner, certificateSigner, certificateActivated)
    { }

    /**
    @dev Get extension address registered from ERC1820 Registry.
    @param addr address of implementer.
    @param interfaceLabel The interface as a string.
     */
    function getExtensionAddress(address addr, string memory interfaceLabel) public view returns (address){
        return interfaceAddr(addr, interfaceLabel);
    }
}
