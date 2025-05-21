# Error Handling and Modifiers

## Error Handling

There are 3 ways to handle errors in solidity

- Require
- Revert
- Assert

When an error is thrown, the gas is refunded and any state variables that were updated before the error was thrown will b undone. From solidity 0.8, you can set custom errors

### Require

Used for access control - controlling who calls a function. Used to validate inputs
Syntax: `require(condition == true, "Callback Error message");`

### Revert

Does about same thing with require but is a better option because it saves more gas. It also a better option if your condition requires an if-else statement

Syntax: `if(condition != true) revert CustomError();`

### Assert

Used to check a condition that should always be true. Used to find bugs in your smart contract

syntax: `assert(condition == true)`

### Custom Errors

It is cheaper than using string which consume a lot of gas since strings generally use up a lot of gas

They only work with revert and not require or assert

You can also log some data in a custom error

```solidity
    error CustomError();
    error CustomErrorWithData(address sender, uint timestamp);

    /// usage
    if(condition != true) revert CustomError();
    if(condition != true) revert CustomErrorWithData(msg.sender, block.timestamp)
```

## Function Modifiers

They are used for grouping code. Also used in error handling to group repititive codes

Modifiers can accept inputs, also they can be used to run additional code before and/or after executing the function
