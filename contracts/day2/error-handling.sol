// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract ErrorHandling {

    address owner;
    bool isPaused;
    uint globalFee = 0.0001 ether;
    
    error UnAuthorized();
    error PaymentFailed(address receiver);

    modifier whenNotPaused (){ /// modifier without argument
        require(!isPaused, "contract is paused");
        _;
    }

    modifier isAllowed(address _caller){ /// modifier with argument
        if(_caller != owner) revert UnAuthorized();
        _;
    }

    modifier chargeFee() {
        require(msg.value >= globalFee, "Insufficient amount sent");
        _;
        balances[msg.sender] -= msg.value;
    }

    mapping(address => uint) public balances;

    constructor(){
        owner = msg.sender;
    }

    function sendEthers(address _receiver) external payable whenNotPaused isAllowed(msg.sender) chargeFee {
        if(msg.value == 0) revert PaymentFailed(_receiver);
        balances[_receiver] += msg.value;
    }

    function transferOwnership(address _newOwner) external payable whenNotPaused isAllowed(msg.sender) chargeFee {
        require(_newOwner != address(0), "Contract cannot be renounced!");
        require(_newOwner != owner, "New owner is current owner!");

        owner = _newOwner;
    }

    function testOwnershipTransfer(address _owner) external view returns(bool) {
        assert(owner == _owner);
        return false;
    }
}