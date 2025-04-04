// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";


import {FoundryToken} from "../src/Counter.sol";


contract FoundryTokenTest is Test {
    FoundryToken public foundryToken;

    function setUp() public {
        foundryToken = new FoundryToken();
    }

    function test_getTokenName() public view {
        assertEq(foundryToken.name(), "FToken");
    }

    function test_getTokenSymbol() public view {
        assertEq(foundryToken.symbol(), "FT");
    }

    function test_getBalance() public view {
        assertEq(foundryToken.totalSupply(), 100);
    }

    function test_mintToken() public {
        foundryToken.mint(address(this), 100);
        assertEq(foundryToken.totalSupply(), 200);
        foundryToken.mint(0xA0716a22474db2fd2fB8038700Ac339E420e483b, 100);
        assertEq(foundryToken.balanceOf(0xA0716a22474db2fd2fB8038700Ac339E420e483b), 100);
    }

    function test_tokenTransfer() public {
        assertEq(foundryToken.balanceOf(0xA0716a22474db2fd2fB8038700Ac339E420e483b),0);
        foundryToken.transfer(0xA0716a22474db2fd2fB8038700Ac339E420e483b, 100);
        assertEq(foundryToken.balanceOf(0xA0716a22474db2fd2fB8038700Ac339E420e483b),100);
    }

    function test_Approve() public {
        foundryToken.mint(address(this), 100);
        assertEq(foundryToken.balanceOf(address(this)),200);
        
        foundryToken.approve(0xA0716a22474db2fd2fB8038700Ac339E420e483b, 200);
        uint256 allowedAmount = foundryToken.allowance(address(this), 0xA0716a22474db2fd2fB8038700Ac339E420e483b);
        
        assertEq(allowedAmount, 200);

        vm.prank(0xA0716a22474db2fd2fB8038700Ac339E420e483b);
        foundryToken.transferFrom(address(this), 0xA0716a22474db2fd2fB8038700Ac339E420e483b, 200);

        assertEq(foundryToken.balanceOf(address(this)), 0);
        assertEq(foundryToken.balanceOf(0xA0716a22474db2fd2fB8038700Ac339E420e483b), 200);
    }
}


