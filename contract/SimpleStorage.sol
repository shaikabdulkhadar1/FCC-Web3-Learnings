// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10; //Here I am saying the solidity compiler to use any version of solidity above 0.8.8

//contract is a reserved keyword used to define the start of the contract
//contract is similar to a Class
contract SimpleStorage {
    
    uint256  favoriteNumber; //Initially set to 0
    //People public person = People({favoriteNumber: 2, name:"Remix"}); //declaring a variable with struct type

    //mapping is similar to dictionary
    mapping(string => uint256) public nameToFavoriteNumber;

    //struct type
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //declaring an array of struct type
    People[] public people;

    //functions are execute a subset of code when called
    //here we are writing a function to store value of favoriteNumber
    //PS- we are writing virtual because we are overriding it
    function store(uint256 _favoriteNumber) public virtual{
        favoriteNumber = _favoriteNumber;
    }

    //this is default function, It makes no difference if you remove it
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //we are writing this function to add values in the array people
    //storage types in solidity - callback, memory and storage
    //callback - temp variable but cannot be modified
    //memory - temp variable and can be modified
    //storge - permanent storage and can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    //struct, mapping and arrays must be specified with the storage type

}

// There are 2 types of fucntions in solidity that requires no gas fee for execution - view and pure