pragma solidity ^0.4.23;

contract Voting {
    
    bytes32[] public candidateList;
    mapping (bytes32 => uint8) public votes;
    
    constructor(bytes32[] candidates) public {
        candidateList = candidates;
    }
    
    function voteForCandidate(uint8 index) public {
        assert(isValidCandidate(index));
        votes[candidateList[index]] += 1;
    }
    
    function totalVotesForCandidate(uint8 index) view public returns (uint8) {
        assert(isValidCandidate(index));
        return votes[candidateList[index]];
    }
    
    function isValidCandidate(uint8 index) view public returns (bool) {
        if (index >= 0 && index < candidateList.length)
            return true;
        else
            return false;
    }
    
}