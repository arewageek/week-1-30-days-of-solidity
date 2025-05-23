// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { AccessControl } from "@arewageek/access-control/contracts/AccessControl.sol";

interface IStorage{
    event DataStored(string indexed key, string value);

    function store(string calldata _key, string calldata _value) external returns (bytes32 keyHash);
    function read(bytes32 _key) external view returns (string memory);
}

contract Storage is AccessControl{
    address public contractAddress;

    mapping(address => mapping(bytes32 => string)) private data;

    function initializeContract(address _contractAddress) external onlyAdmin{
        contractAddress = _contractAddress;
    }

    function store(string calldata _key, string calldata _value) external returns (bytes32 keyHash) {
        keyHash = IStorage(contractAddress).store(_key, _value);
        return keyHash;
    }
    function read(bytes32 _key) external view returns (string memory) {
        return IStorage(contractAddress).read(_key);
    }
}

contract Storage2 is IStorage {
    mapping(address => mapping(bytes32 => string)) private data;

    function store(string calldata _key, string calldata _value) external override returns (bytes32 keyHash) {
        keyHash = keccak256(abi.encodePacked(_key));
        data[msg.sender][keyHash] = _value;
        emit DataStored(_key, _value);

        return keyHash;
    }

    function read(bytes32 _key) external view returns (string memory){
        return data[msg.sender][_key];
    }
}