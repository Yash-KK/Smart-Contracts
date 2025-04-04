// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FoundryToken} from "../src/Counter.sol";

contract CounterScript is Script {
    FoundryToken public foundryToken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        foundryToken = new FoundryToken();

        vm.stopBroadcast();
    }
}
