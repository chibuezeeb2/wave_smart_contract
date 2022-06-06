// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint256 numOfMessages;
    uint private seed;

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave [] waves;

    mapping (address => uint256) public lastWavedAt;
    
    event newWave (address indexed from, string message, uint256 timestamp);

    constructor () payable {
        console.log ("Hey I am a smart contract");
        numOfMessages = waves.length;
        
    }

function wave (string memory _message) public {

    //check if 15mins has elapsed
    require(
        lastWavedAt[msg.sender] + 30 seconds < block.timestamp, "Wait for 30 secs and try again" 
        );
    //set the new timestamp
    lastWavedAt[msg.sender] = block.timestamp;


    totalWaves += 1;
    waves.push(Wave(msg.sender, _message, block.timestamp));
    emit newWave (msg.sender, _message, block.timestamp);

    //generate random Number here
    seed = (block.timestamp + block.difficulty) % 100;
    console.log(seed);

    if (seed < 50) {

        uint256 prizeAmount = 0.0001 ether;
    require (
        prizeAmount <= address(this).balance, "Trying to withdraw more money than balance"
    );
    (bool success,) = (msg.sender).call{value: prizeAmount}("");
    require(success, "Failed to withdraw money from contract");
    console.log("%s WON!!", msg.sender);
    }

    

    console.log("%s has waved with %s", msg.sender, _message);

}

function getTotalWaves() public view returns (uint256) {
    console.log("We have a total of %d waves", totalWaves);
    return totalWaves;
    
}

function getAllWaves() public view returns (Wave[]memory) {
    return waves;
}




}