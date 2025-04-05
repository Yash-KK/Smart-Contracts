// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";


import {LockToken} from "../src/Lock.sol";
import {YashCoin} from "../src/Token.sol";

contract FoundryTokenTest is Test {
    LockToken public lock;
    YashCoin public yc;

    address public ME = 0xA0716a22474db2fd2fB8038700Ac339E420e483b;
    
    function setUp() public {
        yc = new YashCoin();
        lock = new LockToken(address(yc));
    }


    function test_getTokenName() public view {
      assertEq(yc.name(), "YashCoin");
    }

    function test_getTotalTokenSupply() public view {
      assertEq(yc.totalSupply(), 1000);
    }

    function test_DepositAndWithDraw() public {
      yc.mint(ME, 100);
      assertEq(yc.balanceOf(ME), 100);
      
      // I am approving the contract to spend money on my behalf
      vm.startPrank(ME);
      yc.approve(address(lock), 100);

      // check allowance
      assertEq(yc.allowance(ME, address(lock)), 100);

      //Now, I deposit 100 of these tokens into the Lock Contract. This means the Lock Contract should transfer 100 tokens from my account to itself, which it should be able to do since I already approved it (refer to line 40).
      lock.deposit(100);
      assertEq(yc.balanceOf(address(lock)), 100);
      assertEq(yc.balanceOf(ME), 0);

      // I am now withdrawing the amount from the Lock Contract back to my own account.

      lock.withdraw();
      assertEq(yc.balanceOf(address(lock)), 0);
      assertEq(yc.balanceOf(ME), 100);


    }
      
}


