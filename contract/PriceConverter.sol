//This is a library which will be used in FundMe.sol. A library is similar to contract but you cannot declare state variables and cannot send ETH.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    //it will get the price of ETH in USD
    function getPrice() public view returns(uint256) {
        //ABI - 
        //Address - 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (, int256 price,,,) = priceFeed.latestRoundData(); //price of ETH in USD
        return uint256(price*1e10);
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
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
}