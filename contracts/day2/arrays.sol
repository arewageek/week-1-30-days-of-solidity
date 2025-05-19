// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract ArrayLesson {
    address[] public eligibleWallets;
    address[3] public whitelist;

    function addWallet(address _account) external {
        eligibleWallets.push(_account);
    }

    function createWL(address[3] calldata _accounts) external {
        for(uint i = 0; i < _accounts.length; i++){
            whitelist[i] = _accounts[i];
        }
    }

    function removeWalletByIndex(uint _index) public {
        delete eligibleWallets[_index]; /// delete array from specified index
        for(uint i; i < eligibleWallets.length; i ++){
            eligibleWallets[i] = eligibleWallets[i + 1]; /// Shift array elements to replace the previous
        }
        eligibleWallets.pop(); /// Remove the last item from array
    }

    function removeWalletByAddress(address _account) external {
        uint _index;
        for(uint i; i < eligibleWallets.length; i++){
            if(eligibleWallets[i] == _account){
                _index = i;
                break;
            }
        }
        removeWalletByIndex(_index);
    }
}