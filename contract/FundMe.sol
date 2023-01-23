//Aim - Get frunds from the users, withdraw funds, and set a minumim funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./PriceConverter.sol";

// error NotOwner();

//777,933  754,517
contract FundMe {

    using PriceConverter for uint256;

    uint256 public constant MIN_USD = 0.005*10**18; 
    //constant - 21,371
    //non-constant - 23,471

    address[] public funders;
    mapping(address => uint256) public addressToAmoundFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    //using this we will get funds from other users.
    function fund() public payable {

        //require(msg.value >= 1e18, "send 1 ETH Minimum"); //1e18 == 1*10**18 = 10000000000000000 = 1 ETH
            //Reverting - Undo any action before and send remaining gas back

        // require(getConversionRate(msg.value) >= minUSD, "send 1 ETH Minimum");
        require(msg.value.getConversionRate() >= MIN_USD, "Not enough ETH");
        funders.push(msg.sender);
        addressToAmoundFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        //looping through the array
        //Starting index; Ending index; Step amount
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmoundFunded[funder] = 0;
        }

        //resetting the array
        funders = new address[](0);

        //withdrawing funds
        //way-1 : transfer
        // payable(msg.sender).transfer(address(this).balance);

        //way-2 : send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        //way-3 : call
        (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
        //checking the owner
        require(msg.sender == i_owner, "Sender is not owner");
        // if(msg.sender != i_owner) { revert NotOwner(); } //Gas efficient way
        _; // _ means execute the code of the function
    }

    //What happens when people send ETH without calling Fund function
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}