const { ethers } = require("hardhat");

async function main(){
    console.log("Deploying Logic Contract...");
    const Logic = await ethers.getContractFactory("Logic");
    const logic = await Logic.deploy();
    await logic.deployed();
    console.log("Logic Contract deployed at : ",logic.address);

    console.log("Deploying DelegateCall Contract...");
    const DelegateCall = await ethers.getContractFactory("DelegateCall");
    const delegatecall = await DelegateCall.deploy(logic.address,{value:1});
    await delegatecall.deployed();
    console.log("DelegateCall Contract deployed at : ",delegatecall.address);

    console.log("Deploying Attack Contract...");
    const Attack = await ethers.getContractFactory("Attack");
    const attack = await Attack.deploy(delegatecall.address);
    await attack.deployed();
    console.log("Attack Contract deployed at : ",attack.address);
}

main();