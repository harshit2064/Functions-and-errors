
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract PaymentLogger {
    event PaymentReceived(address indexed from, uint amount, bytes data);
    event WithdrawalMade(address indexed to, uint amount);

    mapping(address => uint) public balances;

    receive() external payable {
        emit PaymentReceived(msg.sender, msg.value, msg.data);

        balances[msg.sender] += msg.value;
    }

    function deposit() external payable {
        require(msg.value > 0, "No Ether was sent!");

        emit PaymentReceived(msg.sender, msg.value, msg.data);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed.");

        emit WithdrawalMade(msg.sender, _amount);
    }

    function getBalance() external view returns (uint) {
        return balances[msg.sender];
    }
}
