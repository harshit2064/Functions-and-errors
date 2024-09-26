// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract functionType {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }

    // A view function accessible within the contract and derived contracts as well.
    function getStoredNumber() public view returns (uint) {
        return a;
    }

    // A pure function accessible within the contract and derived contracts only.
    function addNumbers(uint num1, uint num2) internal pure returns (uint) {
        return num1 + num2;
    }

    // A payable function accessible within the contract, derived contract and externally as well.
    function receiveEther() public payable {
        require(msg.value > 0);
        a += msg.value;
    }

}