// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract crowdfunding{
	mapping (address=>uint) contributors;
	address public manager;
	uint public minimumContribution;
	uint public deadline;
	uint public target;
	uint public raisedAmount;
	uint public noOfContributors;

	constructor(uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContribution = 100 wei;
        manager = msg.sender;
	}

	function sendEth() public payable{
		require(manager != msg.sender, "Manager cannot contribute");
        require(block.timestamp < deadline, "Deadline has passed");
        require(msg.value >= minimumContribution, "Minimum Contribution is not met");

        if(contributors[msg.sender] == 0){
            noOfContributors++;
        }
        contributors[msg.sender]+=msg.value;
        raisedAmount+=msg.value;
	}
}