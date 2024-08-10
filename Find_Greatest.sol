// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MaxNumberContract {

    function findMaxNumber(uint256[] memory numbers) external pure returns (uint256) {
       uint256 x;
       for(uint256 i=0;i< numbers.length;i++)
       {
        if(numbers[i] > x)
        {
            x = numbers[i];
        }
       }
       return x;
    }
}