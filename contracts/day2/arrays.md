# Arrays

There are two types of arrays:

- Fixed sized arrays `uint[3]`
- Dynamic arrays `uint[]`

## Fixed Size Array

e.g. `uint[3] public fixedLengthArray;`

- If data is longer than indicated length of array it throws an error
- Fixed size arrays do not use .pop() or .push() since their values can't be adjustedp

## Dynamic Array

e.g `uint[] public dynamicArray`

- Allows you pass any length of data into the array

## Array Methods

### .push()

e.g `dynamicArray.push(4)`

- Adds alloes you add a new item into the array
- Fails when count exeeds fixed length for fixed size arrays
- Adds new element to end of array
- Doesn't work for fixed size arrays
- For fixed size array, replace by index index instead (e.g `dynamicArray[3] = 2`)

### .pop()

- Removes the last item from an array
- Shrinks the size of the array

### delete

e.g `delete dynamicArray[2]`

- Delets an element from an array
- Clears the element in the specified index and changes the value to default (`address(0)` for `address[]`, `0` for `uint[]`, `''` for `string[]`, etc)
- Delete does not reduce the length of the array, it only clears the value and resets it to default

### .length

- Returns the length of the array

## Creating Array in Memory

`uint[] memory a = new uint[](5)`

- Araays created in memory must be of fixed length
- The bigger the array, the more gas it consume

## Deleting Array From an Index

- To delete an index from an array and shrink it's length, you'd have to shift all indexes after it to fill up the space
- After shifting all items to the left, you'd also have to pop the last item from the array
