// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {LibString} from "@solady-utils/LibString.sol";
import {ERC20} from "@openzeppelin-contracts/token/ERC20/ERC20.sol";

contract YashCoin is ERC20 {
    constructor() ERC20("YashCoin", "Y2K") {
        _mint(msg.sender, 1000); // 1000 Wei
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
