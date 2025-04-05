// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {YashCoin} from "../src/Token.sol";

contract CounterScript is Script {
    YashCoin public yc;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        yc = new YashCoin();

        vm.stopBroadcast();
    }
}
