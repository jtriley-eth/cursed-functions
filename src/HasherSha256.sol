// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "src/interfaces/IHasher.sol";

contract HasherSha256 is IHasher {
    function hasher(string memory text) external pure returns (bytes32) {
        return sha256(bytes(text));
    }
}
