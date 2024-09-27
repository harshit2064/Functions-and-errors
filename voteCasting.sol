//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Voting {

    mapping(string => uint) private votes;
    
    event VoteCasted(address indexed voter, string indexed candidate, uint votes);
    event TallyResult(string indexed candidate, uint votes);

    function vote(string memory _candidate) public {
        votes[_candidate] += 1;
        emit VoteCasted(msg.sender, _candidate, votes[_candidate]); 
    }

    function tallyVotes(string memory _candidate) public {
        uint candidateVotes = votes[_candidate];
        emit TallyResult(_candidate, candidateVotes);
    }

    function getVotes(string memory _candidate) public view returns (uint) {
        return votes[_candidate];
    }
}
