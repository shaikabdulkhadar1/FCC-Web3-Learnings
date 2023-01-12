// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//Here we are calling the other contract inside our StorageFactory contract
import "./SimpleStorage.sol";

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //To interact with any contract you need to know 2 things - Address and ABI
        //Address - Address of the contract we are interacting with
        //ABI (Application Binary Interface) - It tells how to interact with the contract
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}