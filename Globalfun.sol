// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MessageContextExample {
    event LogMessage(address indexed sender, string message, uint256 timestamp, uint256 blockNumber, uint256 gasPrice, uint256 valueSent);

    function logMessage(string memory message) public payable {
        address sender = msg.sender;
        uint256 timestamp = block.timestamp;
        uint256 blockNumber = block.number;
        uint256 gasPrice = tx.gasprice;
        uint256 valueSent = msg.value;

        emit LogMessage(sender, message, timestamp, blockNumber, gasPrice, valueSent);
    }

    function getCurrentBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }

    function getSenderAddress() public view returns (address) {
        return msg.sender;
    }

    function getCurrentBlockNumber() public view returns (uint256) {
        return block.number;
    }

    function getCurrentBlockPrevRandao() public view returns (uint256) {
        return block.prevrandao;
    }

    function getGasPrice() public view returns (uint256) {
        return tx.gasprice;
    }
}
