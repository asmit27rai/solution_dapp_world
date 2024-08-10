// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract SimpleOperations {

    /**
     * @notice calculateAverage calculates the average of two numbers
     * @param a the first number
     * @param b the second number
     * @return the average of the two numbers
     */
    function calculateAverage(
        uint256 a,
        uint256 b
    ) public pure returns (uint256) {
        return (a + b) / 2;
    }

    /**
     * @notice getBit returns the bit at the given position
     * @param num the number to get the bit from
     * @param position the position of the bit to get (1-based index)
     * @return the bit at the given position
     */
    function getBit(uint256 num, uint256 position) public pure returns (uint8) {
        require(position > 0, "Position must be greater than 0");
        require(num > 0, "Number must be greater than 0");

        if (position > 256) {
            revert("Position exceeds bit length");
        }

        uint256 bit = (num >> (position - 1)) & 1;
        return uint8(bit);
    }

    /**
     * @notice sendEth sends ETH to the given address
     * @param to the address to send ETH to
     */
    function sendEth(address payable to) public payable {
        require(to != msg.sender, "Cannot send ETH to the sender address");
        require(msg.value > 0, "No ETH sent");

        to.transfer(msg.value);
    }
}


// Code Is Not 100% Correct