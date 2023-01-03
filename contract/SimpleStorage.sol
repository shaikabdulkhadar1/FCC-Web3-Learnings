// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10; //Here I am saying the solidity compiler to use any version of solidity above 0.8.8

//contract is a reserved keyword used to define the start of the contract
//contract is similar to a Class
contract SimpleStorage {
    
    uint256 public favoriteNumber; //Initially set to 0

    //functions are execute a subset of code when called
    //here we are writing a function to store value of favoriteNumber
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}

// There are 2 types of fucntions in solidity that requires no gas fee for execution - view and pure