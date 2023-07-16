import { expect } from "chai";
import hre from "hardhat";

describe("Good Contract without address parameter", () => {
  it("Should not be able to change the owner of the Good Contract", async () => {
    // We cannot supply malicious contract address anymore, since there is no
    // parameter to supply. We can only deploy the contract.
    // Note: this will make deployment a bit more expensive, but well worth it.
    const goodContract = await hre.ethers.deployContract(
      "GoodContractWithExplicitDeploy"
    );
    await goodContract.waitForDeployment();

    const [_, user] = await hre.ethers.getSigners();

    const tx = await goodContract.connect(user).addUserToList();
    await tx.wait();

    const eligible = await goodContract.connect(user).isUserEligible();
    expect(eligible).to.equal(true);
  });
});
