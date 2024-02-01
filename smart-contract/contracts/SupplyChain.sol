// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract SupplyChain is Ownable, AccessControl {
    bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");
    bytes32 public constant VENDOR_ROLE = keccak256("VENDOR_ROLE");
    bytes32 public constant CUSTOMER_ROLE = keccak256("CUSTOMER_ROLE");
    
    // Represent the status of a given Item
    enum Status {
        Ordered,
        Shipped,
        Approved,
        Delivered,
        Cancelled
    }

    // Represents an Item
    struct Item {
        uint id;
        string name;
        Status status;
        address orderedBy; // Customer
        address createdBy; // Manufacturer
        address approvedBy; // Vendor Inspection
    }

    mapping(uint => Item) private items;
    uint private itemCount;

    // Modifiers for restricting functionality based on a given role
    modifier onlyManufacturer() {
        require(hasRole(MANUFACTURER_ROLE, msg.sender), "Error: Caller does not have the Manufacturer Role!");
        _;
    }

    modifier onlyVendor() {
        require(hasRole(VENDOR_ROLE, msg.sender), "Error: Caller does not have the Vendor Role!");
        _;
    }

    modifier onlyCustomer() {
        require(hasRole(CUSTOMER_ROLE, msg.sender), "Error: Caller does not have the Customer Role!");
        _;
    }

    // Constructor of the SupplyChain contract
    constructor(address initialOwner) Ownable(initialOwner) {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MANUFACTURER_ROLE, msg.sender);
        _grantRole(VENDOR_ROLE, msg.sender);
        _grantRole(CUSTOMER_ROLE, msg.sender);
    }

    // Manufacturer Functionality

    function shipItem(uint _id) public onlyManufacturer {
        require(
            items[_id].status == Status.Ordered,
            "Item must be in Ordered state to be shipped to Vendor"
        );
        items[_id].status = Status.Shipped;
        items[_id].createdBy = msg.sender;
    }

    // Vendor Functionality

    function approveItem(uint _id) public onlyVendor {
        require(
            items[_id].status == Status.Shipped,
            "Item must be in Shipped state to be inspected"
        );
        items[_id].status = Status.Approved;
        items[_id].approvedBy = msg.sender;
    }

    function rejectItem(uint _id) public onlyVendor {
        require(
            items[_id].status == Status.Shipped,
            "Item must be in Shipped state to be inspected"
        );
        items[_id].status = Status.Cancelled; //Implement better option if time permits
    }

    function sellItem(uint _id) public onlyVendor {
        require(
            items[_id].status == Status.Approved,
            "Item must be in Approved state to be sold"
        );
        items[_id].status = Status.Delivered;
    }

    // Customer Functionality

    function orderItem(string memory _name) public onlyCustomer {
        Item memory newItem = Item({
            id: itemCount,
            name: _name,
            status: Status.Ordered,
            orderedBy: msg.sender,
            createdBy: address(0),
            approvedBy: address(0)
        });
        items[itemCount] = newItem;
        itemCount++;
    }

    function cancelItem(uint _id) public onlyCustomer {
        require(
            items[_id].status == Status.Ordered,
            "Item can only be cancelled if it is in the Ordered state"
        );
        items[_id].status = Status.Cancelled;
    }

    // Grant and Revoke Roles

    // Manufacturers
    function grantManufacturerRole(address account) external onlyOwner {
        _grantRole(MANUFACTURER_ROLE, account);
    }

    function revokeManufacturerRole(address account) external onlyOwner {
        _revokeRole(MANUFACTURER_ROLE, account);
    }

    // Vendors
    function grantVendorRole(address account) external onlyOwner {
        _grantRole(VENDOR_ROLE, account);
    }

    function revokeVendorRole(address account) external onlyOwner {
        _revokeRole(VENDOR_ROLE, account);
    }

    // Customers
    function grantCustomerRole(address account) external onlyOwner { //TODO: Change to defaultRoleAdmin?
        _grantRole(CUSTOMER_ROLE, account);
    }

    function revokeCustomerRole(address account) external onlyOwner {
        _revokeRole(CUSTOMER_ROLE, account);
    }

    // Public Functions

    function getItemStatus(uint _id) public view returns (Status) {
        return items[_id].status;
    }

    function getItem(uint _id) public view returns (Item memory) {
        return items[_id];
    }

    function getItemCount() public view returns (uint) {
        return itemCount;
    }
}
