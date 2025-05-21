// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract ErrorHandling {

    address owner;
    
    error UnAuthorized();
    error PaymentFailed(address receiver);

    mapping(address => uint) public balances;

    constructor(){
        owner = msg.sender;
    }

    function sendEthers(address _receiver) external payable {
        if(msg.sender != owner) revert UnAuthorized();
        if(msg.value == 0) revert PaymentFailed(_receiver);
        balances[_receiver] += msg.value;
    }

    function transferOwnership(address _newOwner) external {
        require(_newOwner != address(0), "Contract cannot be renounced!");
        require(_newOwner != owner, "New owner is current owner!");

        owner = _newOwner;
    }

    function testOwnershipTransfer(address _owner) external view returns(bool) {
        assert(owner == _owner);
        return false;
    }
}