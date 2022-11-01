// Name: Joy Almeida
// UID: 2020401070 (IT)
pragma solidity ^0.8.7;


contract Joy {
    uint256 private balance;

    constructor(uint256 _balance){
		balance = _balance;
	}

    function buyGrocerries(uint256 expence) public returns (string memory) {
        string memory result;
        if(balance < expence){
            result = "Insufficient Balance";
        }else{
            balance = balance - expence;
            result = "Grocerries bought!";
        }
        return result;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
