# Solidity Contract Readme

📄 **requireAssertRevert.sol** - A Simple Solidity Contract for Error Handling

This is a simple Solidity contract that demonstrates error handling in Solidity using the `assert`, `revert`, and `require` statements.

## Contract Overview

The `SimpleBank` contract includes the following functionality:

- A private mapping `balances` that stores the Ether balance of each address.
- A boolean variable `stopped` to manage the contract's active state.
- A `deposit` function to allow users to deposit Ether into their account.
- A `withdraw` function to enable users to withdraw Ether from their account.
- A `stopContract` function to stop the contract.
- A `resumeContract` function to resume the contract.
- A `forceRevert` function to demonstrate the `revert` statement.
- A `getBalance` function to retrieve the Ether balance of the caller's address.

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
2. Create a new Solidity file and name it "SimpleBank.sol".
3. Copy and paste the contract code into the "SimpleBank.sol" file.
4. Select the appropriate Solidity compiler version (0.8.25 or higher) in the Remix IDE.
5. Compile the contract by clicking the "Compile" button.
6. Once compiled successfully, you can interact with the contract using the Remix IDE's built-in console or by deploying it to a test network.

**Note:** Before interacting with the contract, make sure you have a compatible Ethereum wallet connected to the Remix IDE (e.g., MetaMask).

## Contract Functionality

### `deposit()`

The `deposit` function allows users to deposit Ether into their account. It requires a positive Ether amount to be sent. The function updates the user's balance and emits a `Deposit` event.

Example usage:
```solidity
contractInstance.deposit{value: 1 ether}();
```

### `withdraw(uint256 amount)`

The `withdraw` function enables users to withdraw a specified amount of Ether from their account. It checks for sufficient balance before proceeding and emits a `Withdrawal` event upon successful withdrawal.

Example usage:
```solidity
contractInstance.withdraw(1 ether);
```
### `stopContract()`

The `stopContract` function stops the contract, preventing any deposits or withdrawals until the contract is resumed.

Example usage:
```solidity
contractInstance.stopContract();
```
### `resumeContract()`

The `resumeContract` function resumes the contract, allowing deposits and withdrawals to continue.

Example usage:
```solidity
contractInstance.resumeContract();
```
### `forceRevert()`

The `forceRevert` function demonstrates the revert statement by always reverting with a specific error message.

Example usage:
```solidity
contractInstance.forceRevert();
```

### `getBalance()`

The `getBalance` function retrieves the Ether balance of the caller's address.

Example usage:
```solidity
uint256 balance = contractInstance.getBalance();
```


## 🌟 **Acknowledgement** 🌟

This project was built under the guidance of the [Metacrafters](https://www.metacrafters.io) team as part of their comprehensive [Eth-Avax Proof-intermediate](https://academy.metacrafters.io/content/solidity-avax-intermediate). I express my gratitude to the MetaCrafters team for their support and guidance throughout this learning journey.

## Authors
[Metacrafters](https://www.metacrafters.io) Student   
[Toshik Sharma](https://www.linkedin.com/in/toshik-sharma-855070250/)
