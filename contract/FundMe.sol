//Aim - Get frunds from the users, withdraw funds, and set a minumim fundinv value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract FundMe {

    uint256 public minUSD = 50;

    //using this we will get funds from other users.
    function fund() public payable {

        //require(msg.value >= 1e18, "send 1 ETH Minimum"); //1e18 == 1*10**18 = 10000000000000000 = 1 ETH
        require(msg.value >= 1e18, "send 1 ETH Minimum");
    }

    //function withdraw() {}
}