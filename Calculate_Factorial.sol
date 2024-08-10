// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FactorialContract {

    function calculateFactorial(uint256 n) public pure returns (uint256) {
        uint256 ans = 1;

        for(uint256 i = n ; i > 0 ; i--){
            ans = ans * i;
        }

        return ans;
    }
}