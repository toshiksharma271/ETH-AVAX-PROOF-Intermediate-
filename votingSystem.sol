// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Voting {
    struct Proposal {
        string description;
        uint256 voteCount;
    }

    address public chairperson;
    mapping(address => bool) public voters;
    Proposal[] public proposals;

    constructor() {
        chairperson = msg.sender;
    }

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Only chairperson can perform this action.");
        _;
    }

    function addProposal(string memory description) public onlyChairperson {
        proposals.push(Proposal({ description: description, voteCount: 0 }));
    }

    function giveRightToVote(address voter) public onlyChairperson {
        require(!voters[voter], "The voter already has the right to vote.");
        voters[voter] = true;
    }

    function vote(uint256 proposalIndex) public {
        require(voters[msg.sender], "Has no right to vote.");
        require(proposalIndex < proposals.length, "Invalid proposal index.");

        voters[msg.sender] = false;  // Voter can vote only once
        proposals[proposalIndex].voteCount += 1;
    }

    function getProposal(uint256 proposalIndex) public view returns (string memory description, uint256 voteCount) {
        require(proposalIndex < proposals.length, "Invalid proposal index.");
        Proposal memory proposal = proposals[proposalIndex];
        return (proposal.description, proposal.voteCount);
    }

    function removeProposal(uint256 proposalIndex) public onlyChairperson {
        require(proposalIndex < proposals.length, "Invalid proposal index.");
        for (uint256 i = proposalIndex; i < proposals.length - 1; i++) {
            proposals[i] = proposals[i + 1];
        }
        proposals.pop();
    }

    function endVoting() public onlyChairperson {
        require(proposals.length > 0, "No proposals to vote on.");

        uint256 winningProposalIndex = 0;
        for (uint256 i = 1; i < proposals.length; i++) {
            if (proposals[i].voteCount > proposals[winningProposalIndex].voteCount) {
                winningProposalIndex = i;
            }
        }

        assert(proposals[winningProposalIndex].voteCount >= 0);  

        // Reset the state
        for (uint256 i = 0; i < proposals.length; i++) {
            proposals[i].voteCount = 0;
        }

        delete proposals;
    }

    function emergencyStop() view public onlyChairperson {
        revert("Emergency stop triggered.");
    }
}
