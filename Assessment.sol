// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;

    struct Item {
        string name;
        uint256 price;
    }

    Item[] public itemsForSale;
    string[] public myInventory;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event ItemStored(string itemName);
    event ItemsForSaleRetrieved(Item[] items);
    event InventoryRetrieved(string[] inventory);

    constructor(uint256 initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance; 

        // Initialize items for sale
        itemsForSale.push(Item("Yellow Shirt", 200));
        itemsForSale.push(Item("M416 Skin", 400));
        itemsForSale.push(Item("Shotgun Skin", 500));
        itemsForSale.push(Item("Legendary Marine Outfit", 550));
    }

    function getBalance() public view returns(uint256) {
        return balance;
    }

    function deposit() public payable {
        require(msg.sender == owner, "You are not the owner of this account");
        uint256 _amount = msg.value;
        uint256 _previousBalance = balance;
        balance += _amount;
        assert(balance == _previousBalance + _amount);
        emit Deposit(_amount);
    }

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint256 _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }
        balance -= _withdrawAmount;
        assert(balance == _previousBalance - _withdrawAmount);
        emit Withdraw(_withdrawAmount);
    }

    function getItemsForSale() external returns (Item[] memory) {
        emit ItemsForSaleRetrieved(itemsForSale);
        return itemsForSale;
    }

    function getInventory() external returns (string[] memory) {
        emit InventoryRetrieved(myInventory);
        return myInventory;
    }

    function storeItem(uint256 _value) external returns(string memory) {
        require(_value > 0 && _value <= itemsForSale.length, "Invalid item index");
        Item memory item = itemsForSale[_value - 1];
        require(balance >= item.price, "Insufficient balance");

        balance -= item.price;
        myInventory.push(item.name);

        emit ItemStored(item.name);

        return string(abi.encodePacked("You now have ", item.name));
    }
}
