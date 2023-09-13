// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// ERC20 has to value "name,symbol";

contract Wnlmao is ERC20("DYPUMPING", "dwd") {
    IERC20 nlmao;

    constructor(address _nlmao) {
        nlmao = IERC20(_nlmao);
    }

    function depositnlmao(uint _amount) public {
        nlmao.transferFrom(msg.sender, address(this), _amount);
        uint calculate = (92 * _amount) / 100;
        _mint(msg.sender, calculate);
    }

    function swapBack(uint _amount) public {
        require(
            balanceOf(msg.sender) >= _amount,
            "must be greater than amount"
        );
        nlmao.transfer(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }
}
