# Revert, Assert and Require Solidity Smart Contract Example

A simple Solidity smart contract demonstrating deposit, withdraw, sell item, show inventory and buy item functionalities using Require, Assert and Revert functions.

## Description

This Solidity smart contract allows the owner to manage their balance by depositing and withdrawing Ether. Additionally, it provides functionalities for storing and retrieving items for sale and the owner's inventory. The contract utilizes revert, require, and assert statements for error handling and validation.

## Getting Started

## Features

- Deposit Ether to the contract.
- Withdraw Ether from the contract.
- Retrieve a list of items available for sale.
- Store an item in the owner's inventory.
- Retrieve the owner's inventory.

### Installing

To use this smart contract, you need to have a Solidity development environment set up. You can download the code directly or clone the repository:
```
git clone https://github.com/PreetJawla/Function-and-Errors/blob/main/Assessment.sol
```
### Executing program

* Navigate to the directory where the smart contract file is located.
* Compile the Solidity code using a Solidity compiler like Remix or the Solidity compiler command-line tool.
* Deploy the compiled smart contract to a compatible blockchain network.
* Interact with the deployed contract using a blockchain explorer or a dApp frontend.

### Contract Functions

- `getBalance()`: Returns the current balance of the contract.
- `deposit()`: Allows the owner to deposit Ether into the contract.
- `withdraw(uint256 _withdrawAmount)`: Allows the owner to withdraw Ether from the contract.
- `getItemsForSale()`: Returns the list of items available for sale.
- `getInventory()`: Returns the owner's inventory.
- `storeItem(uint256 _value)`: Stores an item in the owner's inventory based on the provided index.

## Help
If you encounter any issues or have questions about using the smart contract, please contact [preetjawla6@gmial.com].

## Authors

* Preet Jawla
* [preetjawla6@gmail.com]

## License

This project is licensed under the [preet] License - see the LICENSE.md file for details
