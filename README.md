# Funcy Sol

> Note: This could actually be really cool internally in some modular protocol, this is just to
> showcase how weird it can get.

This allows external functions to be assigned to a state variable, which can be returned from the
contract as a `bytes24`, but can also be used internally to make an external call.

## Contracts

### [TextHasher](./src/TextHasher.sol)

This contract stores the external `hasher` function of other contracts. It also logs an event when
the hasher changes.

Using `TextHasher.hash(string)` will make an external call to the current `hasher` contract's
function, which hashes and returns the digest.

### [HasherKeccak256](./src/HasherKeccak256.sol)

This implements `IHasher`, therefore it may be assigned to the `TextHasher.hasher` value.

This simply returns the `keccak256` hash digest to the `TextHasher` contract.

### [HasherSha256](./src/HasherSha256.sol)

This implements `IHasher`, therefore it may be assigned to the `TextHasher.hasher` value.

This simply returns the `sha256` hash digest to the `TextHasher` contract.

### [IHasher](./src/interfaces/IHasher.sol)

This interface requires an inheriting contract implements `hasher(string):(bytes32)`.

Any hashing algorithm may be implemented and used, so long as their external interface conforms to
`IHasher`.
