// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Generates the same ABI as HelperContract.sol
contract MaliciousContract {
    address owner;
    mapping(address => bool) isEligible;

    constructor() {
        owner = msg.sender;
    }

    function isUserEligible(address user) public view returns (bool) {
        if (user == owner) {
            return true;
        }

        return false;
    }

    function setUserEligible(address user) public {
        isEligible[user] = true;
    }

    fallback() external {}
}
