# Inheritance

Inheritance prevents the use of duplicate codes across multiple smart contracts. It allows you build on an existing smart contract

Customizable functions in parent contracts are given the virtual keyword

Example: `function parentFunction() public virtual returns(uint);`

Contract methods that are meant to be inherited should be marked as public functions

When moifying a function, it should be marked it as override. This will allow you change the code for the inherited function.

Private functions are unique to the contract where they were created and cannot be inheritted by another contract

When a contract inherits from two contracts like in the structure below

         "X"
     --<----->--
     |         |
     |         |
     v         v
     |         |
     |         |
    "Y"--->---"Z"

From the chat above, Contract Z is inheriting from both X and Y. Y depends on X so when inheriting, X should be inherited first before Y else it will throw an error since Y requires some functions from X

```solidity
contract Z is X, Y {
    /// rest of contract code
}
```
