// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringComparisonContract {
 
    function compareStrings(string memory str1, string memory str2) external pure returns (bool) {
       return keccak256(bytes(str1)) == keccak256(bytes(str2));
    }
}