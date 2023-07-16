// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Helper {
    mapping(address => bool) isEligible;

    function isUserEligible(address user) public view returns (bool) {
        return isEligible[user];
    }

    function setUserEligible(address user) public {
        isEligible[user] = true;
    }

    fallback() external {}
}
