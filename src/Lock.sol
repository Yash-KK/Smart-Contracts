// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin-contracts/token/ERC20/IERC20.sol";

contract LockToken {
    address public immutable yashCoinAddress;

    mapping(address => uint256) public pendingBalance;

    constructor(address _addr) {
        require(_addr != address(0), "Invalid token address");
        yashCoinAddress = _addr;
    }

    function deposit(uint256 amount) public {
        require(amount > 0, "Amount must be > 0");
        require(
            IERC20(yashCoinAddress).allowance(msg.sender, address(this)) >= amount,
            "Insufficient allowance"
        );

        bool success = IERC20(yashCoinAddress).transferFrom(msg.sender, address(this), amount);
        require(success, "Transfer failed");

        pendingBalance[msg.sender] += amount;
    }

    function withdraw() public {
        uint256 withdrawAmount = pendingBalance[msg.sender];
        require(withdrawAmount > 0, "Nothing to withdraw");

        pendingBalance[msg.sender] = 0;

        bool success = IERC20(yashCoinAddress).transfer(msg.sender, withdrawAmount);
        require(success, "Transfer failed");
    }
}
