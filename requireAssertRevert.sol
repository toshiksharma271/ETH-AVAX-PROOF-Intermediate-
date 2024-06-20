// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleBank {
    mapping(address => uint256) private balances;
    bool private stopped = false;

    
    event Deposit(address indexed account, uint256 amount);
    
    event Withdrawal(address indexed account, uint256 amount);

   
    modifier isNotStopped() {
        require(!stopped, "Contract is stopped");
        _;
    }

   
    function deposit() public payable isNotStopped {
        require(msg.value > 0, "Deposit amount must be greater than zero");

        balances[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    
    function withdraw(uint256 amount) public isNotStopped {
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;

       
        assert(balances[msg.sender] >= 0);

        payable(msg.sender).transfer(amount);

        emit Withdrawal(msg.sender, amount);
    }

    
    function stopContract() public {
        stopped = true;
    }

   
    function resumeContract() public {
        stopped = false;
    }

    
    function forceRevert() public pure {
        revert("This function always reverts");
    }

    
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
