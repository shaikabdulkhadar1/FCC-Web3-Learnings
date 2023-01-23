// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FallbackExample {
    
    uint256 public result;

    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}

// Ether is sent to contract  
//             is msg.data empty?
//                 /       \
//                Yes      No
//                /         \
//             receive()?  fallback()
//              /    \
//             Yes   No
//             /      \
//         receive() fallback()