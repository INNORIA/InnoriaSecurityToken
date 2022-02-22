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
/*    Security contact:   security@innoria.com                                  */
/*    Investor contact:   investors@innoria.com                                 */
/*    Whitepaper:         https://innoria.com/security-tokens                   */
/*    Investor relations: https://innoria.com/investor-relations                */
/*                                                                              */
/* -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - */
/*                                                                              */
/*  Copyright 2022 INNORIA SOLUTION                                             */
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

import { ERC1400TokensValidator } from "./Extensions/ERC1400TokensValidator.sol";

contract InnoriaSecurityTokenValidator is ERC1400TokensValidator {
    constructor() ERC1400TokensValidator() {}

}
