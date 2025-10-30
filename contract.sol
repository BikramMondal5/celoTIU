// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotKing {
    // Predefined candidates (no user input needed)
    string[3] public candidates = ["Alice", "Bob", "Charlie"];

    // Store votes for each candidate
    mapping(string => uint256) public votes;

    // Track if an address has voted
    mapping(address => bool) public hasVoted;

    // Event for logging votes
    event Voted(address indexed voter, string candidate);

    // Function to vote for a candidate
    function vote(uint8 candidateIndex) public {
        require(candidateIndex < candidates.length, "Invalid candidate");
        require(!hasVoted[msg.sender], "You have already voted");

        string memory candidate = candidates[candidateIndex];
        votes[candidate] += 1;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, candidate);
    }

    // Get total votes for all candidates
    function getAllVotes() public view returns (uint256[3] memory) {
        return [
            votes[candidates[0]],
            votes[candidates[1]],
            votes[candidates[2]]
        ];
    }

    // Get current winner
    function getWinner() public view returns (string memory winner) {
        uint256 highest = 0;
        winner = candidates[0];

        for (uint8 i = 0; i < candidates.length; i++) {
            if (votes[candidates[i]] > highest) {
                highest = votes[candidates[i]];
                winner = candidates[i];
            }
        }
    }
}
