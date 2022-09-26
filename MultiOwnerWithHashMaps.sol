// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MultiOwner2 {
    uint totalOwners = 0;
    mapping (uint => address) public holders;
    mapping (address => bool) public isOwner;

    constructor() {
        isOwner[msg.sender] = true;
        holders[totalOwners++] = msg.sender;
        
        // adding example owner
        //isOwner[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = true;
        //holders[totalOwners++] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    }

    function listOwners() public view returns (address[] memory) { 
        address[] memory ret = new address[](totalOwners);
        for (uint i = 0; i < totalOwners; i++) {
            if (isOwner[holders[i]])
                if (holders[i] != address(0))
                    ret[i] = holders[i];
        }
        return ret;
    }

    function addOwner(address owner) public onlyOwner {
        require(!isOwner[owner], "owner exists mister");
        isOwner[owner] = true;
        holders[totalOwners++] = owner;
    }

    function removeOwner(address owner) public onlyOwner { 
        require(isOwner[owner], "owner does not exist");
        require(owner == msg.sender, "you cannot remove your fellow comrades");
        isOwner[owner] = false;
        for (uint i = 0; i < totalOwners; i++) {
            if (holders[i] == owner)
                holders[i] = address(0);
        } 
    }

    modifier onlyOwner() {
       require(isOwner[msg.sender], "pls ser, u are not owner");
        _;
    }
}