// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract AdminOnly {
    address public admin;

    constructor() {
        admin = msg.sender; // The account that deploys the contract becomes the admin
    }

    //restrict access to admin only
    modifier onlyAdmin() {
        require(msg.sender == admin, "Access restricted to admin only");
        _;
    }

    // to find the greater of two numbers
    function findGreater(uint num1, uint num2) public onlyAdmin view returns (uint) {
        if (num1 > num2) {
            return num1;
        } else {
            return num2;
        }
    }

    // to calculate the average of numbers
    function calculateAverage(uint a, unit b, unit c) public onlyAdmin view returns (uint) {
        uint sum = a+b+c;
        return sum / 3;
    }

    // function to change the admin
    function changeAdmin(address newAdmin) public onlyAdmin {
        admin = newAdmin;
    }
}
