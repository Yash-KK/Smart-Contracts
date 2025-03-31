// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ERC20} from "counter/lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
    function decrement() public {
        number--;
    }

}
