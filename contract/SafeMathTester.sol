// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SafeMathTester {
    uint8 public bigNumber = 225; //unchecked

    function add() public {
        bigNumber = bigNumber+1; // < 0.7.6
        unchecked {bigNumber = bigNumber+1;} // >0.7.6
    }
}