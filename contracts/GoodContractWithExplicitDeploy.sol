// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "./HelperContract.sol";

contract GoodContractWithExplicitDeploy {
    Helper public helper;

    constructor() payable {
        // Deploys a new helper contract instead of relying on address.
        // This makes sure we can rely on the helper contract's code, instead of
        // an attacker deploying a malicious contract with the same ABI.
        helper = new Helper();
    }

    function isUserEligible() public view returns (bool) {
        return helper.isUserEligible(msg.sender);
    }

    function addUserToList() public {
        helper.setUserEligible(msg.sender);
    }

    fallback() external {}
}
