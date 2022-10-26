import { ethers, upgrades } from "hardhat";
import { Box, Box__factory } from "../typechain-types";
import { expect } from "chai";

describe("Box {proxy}", () => {
  let box: Box;

  beforeEach(async () => {
    const BoxFactory: Box__factory = await ethers.getContractFactory("Box");
    box = await upgrades.deployProxy(BoxFactory, [42], {
      initializer: "store",
    }) as Box;
  });

  it("Should return a value previously initialized", async () => {
    expect((await box.retrieve())).to.equal('42');
  });
});
