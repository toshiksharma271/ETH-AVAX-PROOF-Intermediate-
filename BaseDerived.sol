// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract BaseContract {
    uint256 public storedNumber;

    constructor(uint _initialNumber) {
        storedNumber = _initialNumber;
    }

    function getStoredNumber() public view returns (uint) {
        return storedNumber;
    }

    function addNumbers(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function receiveEther() public payable {
        require(msg.value > 0, "Must send some ether");
        storedNumber += msg.value;
    }
}

contract DerivedContract is BaseContract {
    constructor(uint _initialNumber) BaseContract(_initialNumber) {}

    function callGetStoredNumber() public view returns (uint) {
        return getStoredNumber();
    }

    function callAddNumbers(uint a, uint b) public pure returns (uint) {
        return addNumbers(a, b);
    }

    function callReceiveEther() public payable {
        receiveEther();
    }
}

