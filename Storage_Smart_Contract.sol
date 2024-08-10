// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StorageContract {
    uint ans;
    // Function to store a new value
    function storeValue(uint256 _newValue) public {
        ans = _newValue;
    }

    // Function to read the stored value
    function readValue() public view returns (uint256) {
       return ans;
    }
}