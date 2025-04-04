// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {LibString} from "@solady-utils/LibString.sol";
import {ERC20} from "@openzeppelin-contracts/token/ERC20/ERC20.sol";

contract FoundryToken is ERC20 {
    constructor() ERC20("FToken", "FT") {
        _mint(msg.sender, 100); // 100 Wei
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
        
