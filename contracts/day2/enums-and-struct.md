# Enum and Structs

## Enum

Enums allow you express multiple possible values and can be assigned to a variable

Enums are represented like objects. e.g `Status.Pending`

It is not required that all enums are named with uppercase. they can be capitalized

## Structs

Structs are used for grouping data. They allow us create custom data structure

Can be updated either using the struct's key or in form of an object

e.g

```solidity
    Car memory toyota = Car("Toyota", 1990);
    /// or
    Car memory honda = Car({brand: "Honda", year: 1992});
    /// or
    Car memory car;
    car.brand = "Lexus";
    car.year = 1994;
```

The delete keyword can be used to clear the data stored in a specific struct element, resetting it to its default value
e.g `delete car.owner`
