//Aim - Get frunds from the users, withdraw funds, and set a minumim funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minUSD = 50*1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmoundFunded;

    //using this we will get funds from other users.
    function fund() public payable {

        //require(msg.value >= 1e18, "send 1 ETH Minimum"); //1e18 == 1*10**18 = 10000000000000000 = 1 ETH
            //Reverting - Undo any action before and send remaining gas back

        // require(getConversionRate(msg.value) >= minUSD, "send 1 ETH Minimum");
        require(msg.value.getConversionRate() >= minUSD, "send 1 ETH Minimum");
        funders.push(msg.sender);
        addressToAmoundFunded[msg.sender] = msg.value;
    }

    function withdraw() public {
        //Starting index; Ending index; Step amount
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmoundFunded[funder] = 0;
        }
    }
}