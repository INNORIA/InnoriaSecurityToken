// SPDX-License-Identifier: Apache-2.0
/**
    Extension contract to handle validator logic
 */

pragma solidity ^0.8.6;

import { ERC1400TokensValidator } from "./Extensions/ERC1400TokensValidator.sol";

contract InnoriaSecurityTokenValidator is ERC1400TokensValidator {
    constructor() ERC1400TokensValidator() {}

}
