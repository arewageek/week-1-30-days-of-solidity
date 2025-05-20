# Mapping

In arrays, it is impossible to get a specific data from a mapping without looping through the entire array to the point where the data is located.
Using mapping, with a single lookup you can get a particular data from an array

Any kind of data can be stored in a mapping - including other mapping (nested mapping)

## Deleting Data from a mapping

To delete the data stored in a mapping, use the delete keyword

e.g `delete balances[msg.sender]`

This resets the value to it's default

## Iteratable Mapping

Unlike arrays, mapping cannot be iterated
To keep track of all the data stored in a mapping, you need to create a seperate variable to host the keys
e.g

```solidity
    mapping (address => uint) public balances;
    address[] public keys;

    function getSize() external returns (uint){
        return keys.length;
    }
```
