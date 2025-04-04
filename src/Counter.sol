// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {LibString} from "@solady-utils/LibString.sol";
import {ERC20} from "@openzeppelin-contracts/token/ERC20/ERC20.sol";

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
