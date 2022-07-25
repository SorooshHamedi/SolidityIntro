// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract MyContractMapping {
    mapping(uint => string) names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }
    constructor() public {
        names[1] = "Adam";
    }

    function addBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author); 
    }

}