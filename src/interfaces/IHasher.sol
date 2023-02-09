// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface IHasher {
    function hasher(string memory) external pure returns (bytes32);
}
