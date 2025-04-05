// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {YashCoin} from "../src/Token.sol";

contract FoundryTokenTest is Test {
    YashCoin public yc;

    function setUp() public {
        yc = new YashCoin();
    }

    function test_getTokenName() public view {
        console.log(address(this));
        assertEq(yc.name(), "YashCoin");
    }
}
