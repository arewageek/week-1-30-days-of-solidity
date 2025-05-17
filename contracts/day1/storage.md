# STORAGE

From my understanding, there are 3 main types of storage

- storage
- memory
- calldata

## Storage

Storage data points to state varables and when modified they directly affect the state variables.

## Memory

For memory variables, a copy of it is created in the memory. These type of data can be modified but will not change in the state variable. Their values reset once the function finish executing

## Calldata

These are readonly variables that are used to point to arguments passed into a function. They only exist within the scope of that function. Their values reset once the function completes its execution

## Summary

- Calldata uses the least gas because it is readonly and limited to the scope of the function where it was created
- Calldata and memory reset once the function completes execution
- Changes made to storage affects the state variable they represent
- Calldata is usually used for function's argument
- Memory can be modified but does not change any state variable
- Calldata cannot be used as a return type for a function because it cannot be modified
