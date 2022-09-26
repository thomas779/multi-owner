// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MultiOwner {
    address[] public owners;

    constructor() {
        owners = [msg.sender];
    }

    function listOwners() public view returns(address[] memory) {
        return owners;
    }

    function addOwner(address i) public onlyOwner {
        require(!checkOwnerExists(i), "owner exists mister");
        owners.push(i);
    }

    function removeOwner(address owner) public onlyOwner { 
        require(checkOwnerExists(owner) , "owner does not exist");
        require(owner == msg.sender, "you cannot remove your fellow comrades");
        for (uint i=0; i < owners.length; i++ ) {
            if (owner == owners[i]) {
                delete owners[i];
            }
        }
        address[] memory arrayNew;
        for (uint i=0; i < owners.length; i++ ) {
            if (owners[i] != address(0)) {
                continue;
            }
            arrayNew[i] = owners[i];
        }
    }

    function checkOwnerExists(address addressOwner) internal view returns (bool) {
        for (uint i=0; i < owners.length; i++ ) {
            if (addressOwner == owners[i]) {
                return true;
            }
        }
        return false;
    }

    modifier onlyOwner() {
        require(checkOwnerExists(msg.sender), "pls ser, u are not the owner");
        _;
    }
}