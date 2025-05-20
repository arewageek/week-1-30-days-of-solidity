// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract MappingContract {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public transfers; /// nested mapping
    address[] public keys;

    function getSize() external view returns (uint){
        return keys.length;
    }

    function first() external view returns (uint){
        return balances[keys[0]];
    }

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _index) external view returns (uint) {
        return balances[keys[_index]];
    }
}