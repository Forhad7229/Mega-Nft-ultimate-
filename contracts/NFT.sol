// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFT {
    uint public tokenCount;

    function mint() public {
        tokenCount++;
    }
}
