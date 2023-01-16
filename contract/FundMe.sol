//Aim - Get frunds from the users, withdraw funds, and set a minumim funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minUSD = 50*1e18;

    //using this we will get funds from other users.
    function fund() public payable {

        //require(msg.value >= 1e18, "send 1 ETH Minimum"); //1e18 == 1*10**18 = 10000000000000000 = 1 ETH
            //Reverting - Undo any action before and send remaining gas back
        
        require(getConversionRate(msg.value) >= minUSD, "send 1 ETH Minimum");
    }

    //it will get the price of ETH in USD
    function getPrice() public view returns(uint256) {
        //ABI - 
        //Address - 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price,,,) = priceFeed.latestRoundData(); //price of ETH in USD
        return uint256(price*1e10);
    }

    //it will convert eth value into USD
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice*ethAmount)/1e18; //our ETH value in USD
        // 3000.000000000000000000 = ETH / USD
        // 1.000000000000000000 ETH 
        // returns -> 3000.000000000000000000 ~ 3000
        return ethAmountInUsd;
    }

    //function withdraw() {}
}