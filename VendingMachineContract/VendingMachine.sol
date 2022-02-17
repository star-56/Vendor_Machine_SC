//SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
//this is a donut vending Machine smart contract
contract VendingMachine{
    // set the owner as th address that deployed the contract
address  public owner;
mapping(address => uint) public DonutBalances ; 
    // set the initial vending machine balance to 100
   
   constructor(){
       owner = msg.sender;
       DonutBalances[address(this)] = 100;
   }
   //to get the balance of vending machine..
   function getBalance() public view returns (uint){
       // this particular statement can be executed w/o the get function also ,
       //but to give a nice wrapped up to it :function is implied.
   return DonutBalances[address(this)];
   }
   //now restocking the donuts inthe vending machine
   //we need a restock functiomn to update/modify the initial value of donuts
   function Restock(uint amount) public {
       require(msg.sender == owner, "only owner can access the contract and restock the donuts");
       DonutBalances[address(this)]+= amount;
   }
//for client to be able to purchase donuts we need a purchase function..
function purchaseDonuts(uint amount)public payable{
    require(msg.value >= amount*2 ether , "you must pay atleast 2 ether for these delecious donuts");
    require(DonutBalances[address(this)] >= amount , "not enough donuts in machine , purchase failed");
    DonutBalances[address(this)]-= amount;
    DonutBalances[msg.sender]+= amount;
   }
}
