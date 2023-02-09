// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "src/interfaces/IHasher.sol";

contract HasherKeccak256 is IHasher {
    function hasher(string memory text) external pure returns (bytes32) {
        return keccak256(bytes(text));
    }
}
