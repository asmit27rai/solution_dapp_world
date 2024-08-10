// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePaymentChannel {

    address owner;
    address recepient;
    mapping(address => uint256) deposits;
    mapping(address => uint256) listed;
    uint256[] listings;

    error Invalid_Deposit();
    error Invalid_Amount();
    error Unautorized();
    error Transaction_Failed();
  
    constructor(address recipientAddress) {
        owner = msg.sender;
        recepient = recipientAddress;
    }

    function deposit() public payable {
        if (msg.value < 1) {
            revert Invalid_Deposit();
        }

        deposits[msg.sender] += msg.value;
    }

    function listPayment(uint256 amount) public {
        if (amount > deposits[msg.sender] - listed[msg.sender]) {
            revert Invalid_Amount();
        }

        listed[msg.sender] += amount;
        listings.push(amount);

        
        (bool success, ) = payable(owner).call{value:amount}("");
        if(!success) {
            revert Transaction_Failed();
        }
    }

    function closeChannel() public {
        if (msg.sender != owner && msg.sender != recepient) {
            revert Unautorized();
        }

        uint256 remaining = deposits[recepient] - listed[recepient];
        if(remaining > 0) {
            (bool success, ) = payable(recepient).call{value:remaining}("");
            if(!success) {
                revert Transaction_Failed();
            }
        }
    }

    function checkBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getAllPayments() public view returns (uint256[] memory) {
        return listings;
    }
}