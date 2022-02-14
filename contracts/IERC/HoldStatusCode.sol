// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.6;

enum HoldStatusCode {
    Nonexistent,
    Ordered,
    Executed,
    ExecutedAndKeptOpen,
    ReleasedByNotary,
    ReleasedByPayee,
    ReleasedOnExpiration
}