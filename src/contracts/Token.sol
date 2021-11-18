// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    //add minter variable
    address public minter;

    //add minter changed event

    constructor() public payable ERC20("DBank Currency", "DCB") {
        //asign initial minter
        minter = msg.sender;
    }

    //Add pass minter role function

    function mint(address account, uint256 amount) public {
        //check if msg.sender have minter role
        require(msg.sender == minter, "Only minter can mint tokens");

        _mint(account, amount);
    }
}
