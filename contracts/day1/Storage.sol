// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract Storage {
    string public text;

    function save (string calldata _text) external {
        text = _text;
    }

    function read () external view returns (string memory) {
        return text;
    }
}

contract ArrayStorage {
    address[] public users;

    function add (address[] calldata _user) external {
        for(uint i; i < _user.length; i++){
            users.push(_user[i]);
        }
    }

    function read() external view returns (address[] memory){
        return users;
    }
}