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

	struct Request{
		string eventName;
		address payable recipient;
		uint value;
		bool completed;
		uint noOfVoters;
		mapping(address=>bool) voters;
	}
	mapping(uint=>Request) public requests;
	uint public numRequests;

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

	function getContractBalance() public view returns(uint){
		return address(this).balance;
	}
	function refund() public{
		require(block.timestamp > deadline && raisedAmount<target, "You are not eligible for refund");
		require(contributors[msg.sender] > 0);
		address payable user = payable(msg.sender);
		user.transfer(contributors[msg.sender]);
		contributors[msg.sender] = 0;
	}
}