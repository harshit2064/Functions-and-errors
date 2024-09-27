//SPDX-License-Identifier: MIT

const hre = require("hardhat");

async function main() {
    const Voting = await hre.ethers.getContractFactory("Voting");
    const voting = await Voting.deploy();

    await voting.deployed();

    console.log("Contract deployed to:", voting.address);

    voting.on("VoteCasted", (voter, candidate, votes) => {
        console.log(`Vote casted by: ${voter}, for candidate: ${candidate}, current votes: ${votes}`);
    });

    voting.on("TallyResult", (candidate, votes) => {
        console.log(`Tally result for candidate: ${candidate}, total votes: ${votes}`);
    });
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});