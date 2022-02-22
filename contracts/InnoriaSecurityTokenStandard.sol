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
/* -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - */
/*                                                                              */
/*    Website:            https://innoria.com/                                  */
/*    Contact:            contact@innoria.com                                   */
/*    Whitepaper:         https://innoria.com/security-tokens                   */
/*    Investor relations: https://innoria.com/investor-relations                */
/*                                                                              */
/* -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - */
/*                                                                              */
/*  Copyright © 2022 INNORIA SOLUTION                                           */
/*                                                                              */
/*  Licensed under the Apache License, Version 2.0 (the "License");             */
/*  you may not use this file except in compliance with the License.            */
/*  You may obtain a copy of the License at                                     */
/*                                                                              */
/*      http://www.apache.org/licenses/LICENSE-2.0                              */
/*                                                                              */
/*  Unless required by applicable law or agreed to in writing, software         */
/*  distributed under the License is distributed on an "AS IS" BASIS,           */
/*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    */
/*  See the License for the specific language governing permissions and         */
/*  limitations under the License.                                              */
/*                                                                              */
/********************************************************************************/

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

import { ERC1400 } from "./ERC1400Base/ERC1400.sol";

contract InnoriaSecurityTokenStandard is ERC1400 {

    /**
     * @dev Initialize ERC1400 + register the contract implementation in ERC1820Registry.
     * @param tokenName Name of the token.
     * @param tokenSymbol Symbol of the token.
     * @param tokenGranularity Granularity of the token.
     * @param tokenControllers Array of initial controllers.
     * @param defaultPartitions Partitions chosen by default, when partition is
     * not specified, like the case ERC20 tranfers.
     */
    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        uint256 tokenGranularity,
        address[] memory tokenControllers,
        bytes32[] memory defaultPartitions
    ) ERC1400(tokenName, tokenSymbol, tokenGranularity, tokenControllers, defaultPartitions) { }
}
