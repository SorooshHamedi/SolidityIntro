// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract HotelRoom {
    enum Status {
        Vacant,
        Occupied
    }

    event Occupy(address _occupant, uint _value);

    Status public currentStatus;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Status.Vacant, "Room is currently occupied.");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }
    function book() public payable onlyWhileVacant costs(2 ether) {
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);
        currentStatus = Status.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}