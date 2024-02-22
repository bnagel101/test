// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20; //the ^ means other versions with minor changes above 0.8.20 will also work


contract Hw3 {

    // Address to its list of contacts
    mapping(address => address[]) private contacts;

    // User address to another address and its nickname
    mapping(address => mapping(address => string)) private nicknames;

    // Returns contacts
    function getContacts(address caller) external view returns (address[] memory) {
        return contacts[caller];
    }

    // Adds a contact
    function addContact(address contact) external {
        contacts[msg.sender].push(contact);
    }

    // Replaces the caller's contacts
    function setContacts(address[] calldata newContacts) external {
        contacts[msg.sender] = newContacts;
    }

    // Returns nickname
    function getNickname(address caller, address contact) external view returns (string memory) {
        return nicknames[caller][contact];
    }

    // Assigns nickname
    function setNickname(address contact, string calldata nickname) external {
        nicknames[msg.sender][contact] = nickname;
    }


    function doMath(int256 a, int256 b) public pure returns (int256){
        return (2*a)+ (2*b);
    }

    function getMax(uint256[] memory arr) public pure returns (uint256) {
        require(arr.length > 0, "Array is empty");
        uint256 max = arr[0];
        for (uint i = 1; i < arr.length; i++) {
            if (arr[i] > max) {
                max = arr[i];
            }
        }
        return max;
    }

    function hashStringArray(string[] memory arr) public pure returns (bytes32[] memory) {
        bytes32[] memory hashes = new bytes32[](arr.length);
        for (uint i = 0; i < arr.length; i++) {
            hashes[i] = keccak256(abi.encode(arr[i]));
        }
        return hashes;
    }



}