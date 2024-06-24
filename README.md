# Solidity Contract Readme

📄 **Voting.sol** - A Simple Solidity Contract for Voting with Error Handling

# Voting System

This is a simple Solidity contract that demonstrates error handling in Solidity using the `assert`, `revert`, and `require` statements. The contract implements a voting system where the chairperson can add proposals, give voting rights, allow participants to vote on proposals, and end the voting process.

## Contract Overview

The `Voting` contract includes the following functionality:

- A `chairperson` variable that stores the address of the contract deployer.
- A `voters` mapping to track which addresses have the right to vote.
- A `proposals` array to store the list of proposals.
- Functions to add proposals, give voting rights, cast votes, remove proposals, end voting, and handle emergencies.

## Error Handling

### `require()`

The `require()` statement is used to validate certain conditions before further execution of a function.

Example:
```solidity
require(<condition to be validated>, <message to be displayed if the condition fails>);
```

### `assert()`

The `assert()` statement is similar to `require()` and checks for conditions. If a condition fails, the function execution is terminated with an error message.

Example:
```solidity
assert(<condition to be checked/validated>);
```

### `revert()`

The `revert()` statement can be used to flag an error and revert the current call. It can also include a message providing details about the error, which will be passed back to the caller.

Example:
```solidity
revert("This function always reverts");
```

## Using the Contract in Remix IDE

To use this contract in the Remix IDE, follow these steps:

1. Open the Remix IDE (https://remix.ethereum.org/).
2. Create a new Solidity file and name it "Voting.sol".
3. Copy and paste the contract code into the "Voting.sol" file.
4. Select the appropriate Solidity compiler version (0.8.0 or higher) in the Remix IDE.
5. Compile the contract by clicking the "Compile" button.
6. Once compiled successfully, you can interact with the contract using the Remix IDE's built-in console or by deploying it to a test network.

**Note:** Before interacting with the contract, make sure you have a compatible Ethereum wallet connected to the Remix IDE (e.g., MetaMask).

## Contract Functionality

### `addProposal(string description)`

The `addProposal` function allows the chairperson to add a new proposal with a given description.

Example usage:
```solidity
contractInstance.addProposal("New Proposal");
```

### `giveRightToVote(address voter)`

The `giveRightToVote` function grants the right to vote to a specified address. It checks if the voter already has voting rights before granting.

Example usage:
```solidity
contractInstance.giveRightToVote(0x1234...);
```

### `vote(uint256 proposalIndex)`

The `vote` function allows a voter to vote for a specific proposal. It ensures the voter has the right to vote and the proposal index is valid.

Example usage:
```solidity
contractInstance.vote(0);
```

### `getProposal(uint256 proposalIndex)`

The `getProposal` function retrieves the description and vote count for a given proposal index.

Example usage:
```solidity
(string memory description, uint256 voteCount) = contractInstance.getProposal(0);
```

### `removeProposal(uint256 proposalIndex)`

The `removeProposal` function allows the chairperson to remove a proposal at a specific index. It ensures the proposal index is valid and shifts remaining proposals.

Example usage:
```solidity
contractInstance.removeProposal(0);
```

### `endVoting()`

The `endVoting` function ends the voting process, calculates the winning proposal, and resets the vote counts. It ensures there are proposals to vote on and uses `assert` to check internal consistency.

Example usage:
```solidity
contractInstance.endVoting();
```

### `emergencyStop()`

The `emergencyStop` function triggers an emergency stop, reverting any transactions and providing an error message.

Example usage:
```solidity
contractInstance.emergencyStop();
```

### State Variables

- **`chairperson`**: Stores the address of the chairperson who deployed the contract. It is of type `address`.
- **`proposals`**: An array of proposals in the contract. It is of type `Proposal[]` (array of Proposal structs).
- **`voters`**: A mapping to track which addresses have the right to vote. It is of type `mapping(address => bool)`.

This detailed breakdown of the contract functions and state variables should help you understand and present the functionality of the Voting contract effectively.


## 🌟 **Acknowledgement** 🌟

This project was built under the guidance of the [Metacrafters](https://www.metacrafters.io) team as part of their comprehensive [Eth-Avax Proof-intermediate](https://academy.metacrafters.io/content/solidity-avax-intermediate). I express my gratitude to the MetaCrafters team for their support and guidance throughout this learning journey.

## Authors
[Metacrafters](https://www.metacrafters.io) Student   
[Toshik Sharma](https://www.linkedin.com/in/toshik-sharma-855070250/)
