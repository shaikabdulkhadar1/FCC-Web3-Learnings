// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./SimpleStorage.sol";

//is keyword is used to mark inheritance in solidity
//Here ExtraStorage contract is inherting from SimpleStorage
contract ExtraStorage is SimpleStorage {
    //As we are inheriting values we can modify the functionality of the functions

    //Here we are overriding store function
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber+5;
    }
}