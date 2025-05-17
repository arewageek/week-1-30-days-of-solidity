# Function Visibility

There are 4 types of functions

- view
- pure
- internal
- external
- public
- private

## View Functions

- These types of functions are used for reading data from the contract only
- Cannot modify the contract or state variables

## Pure Functions

- These functions do not have any form of access to the contract
- Cannot read or modify annything in the contract

## Internal

- Can be read by the contract itself (other functions within the contract)
- Can be read by contracts inheriting this contract but not by others outside

## External

- These functions can only be read from outside the contract but not from within

## Public

- These functions are visible within and outside the contract
- Functions can be read by other functions within the contract, child contracts that inherit it, or outside the contract generally

## Private

- Provate data or functions can onlt be read within the current contract
- Cannot be read outside the contract or by other contracts inherring it
