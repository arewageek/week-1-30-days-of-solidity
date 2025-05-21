// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Ownable {
    address public owner;
    address public pendingOwner;

    enum Role {
        Admin,
        Moderator
    }

    mapping(address => mapping(Role => bool)) public roles;

    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }
    modifier notZeroAddress (){
        require(msg.sender != address(0), "Invalid owner");
        _;
    }

    modifier onlyRole(Role _role){
        require(roles[msg.sender][_role], "Not authorized");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function transferOwnership(address _newOwner) external onlyOwner notZeroAddress {
        owner = _newOwner;
    }

    function partialOwnershipTransfer(address _newOwner) external onlyOwner notZeroAddress {
        pendingOwner = _newOwner;
    }

    function acceptOwnership() external {
        require(msg.sender == pendingOwner, "Not authorized");
        owner = msg.sender;
    }

    function assignRole(address _account, Role _role) external onlyRole(Role.Moderator){
        roles[_account][_role] = true;
    }

    function removeRole(address _account, Role _role) external onlyRole(Role.Admin){
        roles[_account][_role] = false;
    }
}