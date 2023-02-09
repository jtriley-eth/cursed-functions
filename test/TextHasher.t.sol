// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "lib/forge-std/src/Test.sol";
import "src/TextHasher.sol";
import "src/HasherKeccak256.sol";
import "src/HasherSha256.sol";

contract TextHasherTest is Test {
    event HasherSet(
        address indexed setter,
        function(string memory) external view returns (bytes32) indexed oldHasher,
        function(string memory) external view returns (bytes32) indexed newHasher
    );

    TextHasher textHasher;
    HasherKeccak256 hasherKeccak256;
    HasherSha256 hasherSha256;

    function setUp() external {
        textHasher = new TextHasher();
        hasherKeccak256 = new HasherKeccak256();
        hasherSha256 = new HasherSha256();
    }

    function testSetHasher() external {
        function(string memory) external view returns (bytes32) empty;

        vm.expectEmit({
            checkTopic1: false,
            checkTopic2: true,
            checkTopic3: true,
            checkData: true,
            emitter: address(textHasher)
        });
        emit HasherSet(address(0), empty, hasherKeccak256.hasher);

        textHasher.setHasher(hasherKeccak256.hasher);
    }

    function testHasherKeccak256() external {
        string memory text = "asdf";

        textHasher.setHasher(hasherKeccak256.hasher);

        assertEq(textHasher.hash(text), hasherKeccak256.hasher(text));
        assertEq(textHasher.hash(text), keccak256(bytes(text)));
    }

    function testHasherSha256() external {
        string memory text = "asdf";

        textHasher.setHasher(hasherSha256.hasher);

        assertEq(textHasher.hash(text), hasherSha256.hasher(text));
        assertEq(textHasher.hash(text), sha256(bytes(text)));
    }
}
