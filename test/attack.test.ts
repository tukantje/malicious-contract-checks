import { expect } from "chai";
import hre from "hardhat";

describe("Attack using Malicious External Contract", () => {
  it("Should change the owner of the Good Contract", async () => {
    const maliciousContract = await hre.ethers.deployContract(
      "MaliciousContract",
      []
    );
    await maliciousContract.waitForDeployment();

    const goodContract = await hre.ethers.deployContract("GoodContract", [
      maliciousContract.target,
    ]);
    await goodContract.waitForDeployment();

    const [_, user] = await hre.ethers.getSigners();

    const tx = await goodContract.connect(user).addUserToList();
    await tx.wait();

    const eligible = await goodContract.connect(user).isUserEligible();
    expect(eligible).to.equal(false);
  });
});
