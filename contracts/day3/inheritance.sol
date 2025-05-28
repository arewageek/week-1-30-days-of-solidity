// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract ParentContract1 {
    uint public index;

    constructor(uint _index){
        index = _index;
    }

    function doIncrement() public virtual{
        index ++;
    }
}

contract ParentContract2 is ParentContract1(6) {
    string public name;
    constructor(string memory _name){
        name = _name;
    }

    function sayName () public virtual returns(string memory){
        return name;
    }

    function doIncrement () public virtual override {
        index += 5;
    }
}

contract ParentContract3 {
    uint public age;
    constructor(uint _age){
        age = _age;
    }
}

contract ChildContract1 is ParentContract1, ParentContract2("Arewa") {
    uint public newIndex;

    function doIncrement() public virtual override (ParentContract1, ParentContract2) {
        index += 5;
    }
}

contract ChildContract2 is ParentContract2, ParentContract3 {
    constructor (string memory _name, uint _age) ParentContract3(_age) ParentContract2(_name){}
}