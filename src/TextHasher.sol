// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/// @title Text Hasher
/// @author jtriley.eth
/// @notice Hasher is interchangeable
contract TextHasher {
    /// @notice Interchangeable Hasher Contract
    function(string memory) external view returns (bytes32) public hasher;

    /// @notice Logged when the Hasher changes
    /// @param setter Address that set the Hasher
    /// @param oldHasher Old Hasher
    /// @param newHasher New Hasher
    event HasherSet(
        address indexed setter,
        function(string memory) external view returns (bytes32) indexed oldHasher,
        function(string memory) external view returns (bytes32) indexed newHasher
    );

    /// @notice Sets the Hasher
    /// @param newHasher New Hasher
    function setHasher(
        function(string memory) external view returns (bytes32) newHasher
    ) external {
        require(newHasher("test") != bytes32(0), "Invalid Hasher");
        function(string memory) external view returns (bytes32) oldHasher = hasher;
        hasher = newHasher;
        emit HasherSet(msg.sender, oldHasher, newHasher);
    }

    /// @notice Hashes text with current Hasher
    /// @param text Text to hash
    /// @return hashedText Hashed text
    function hash(string memory text) external view returns (bytes32 hashedText) {
        hashedText = hasher(text);
        require(hashedText != bytes32(0), "Invalid Hasher");
    }
}
