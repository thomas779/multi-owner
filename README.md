# multi-owner
Multisig wallet implemented with hash-maps and arrays.

* Elements are added, removed, and checked for existence in constant time (O(1)).
* Elements are enumerated in O(n). No guarantees are made on the ordering.
* Hasmaps faster, optimised and gas efficient but unable to iterate over keys/values.
* A mixture of arrays and hash-maps can also be implemented as 

![Complexity Chart](https://cdn.discordapp.com/attachments/847055312962977842/1023715602386399293/unknown.png)

## Next steps?
* Optimise `removeOwner()` in both implementations
* Use OZ [EnumerateSet.sol](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/structs/EnumerableSet.sol) ─ I wanted to expiriment for myself being the prime optimizooor that I am.