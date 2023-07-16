// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "./HelperContract.sol";

contract GoodContract {
    Helper helper;

    constructor(address helperAddress) payable {
        helper = Helper(helperAddress);
    }

    function isUserEligible() public view returns (bool) {
        return helper.isUserEligible(msg.sender);
    }

    function addUserToList() public {
        helper.setUserEligible(msg.sender);
    }

    fallback() external {}
}
