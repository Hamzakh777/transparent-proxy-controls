// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// When working with Proxies the `implementation` can't have a constructor
// because we want all the data to be stored in the Proxy

contract Box {
  uint256 private value;

  // Emitted when the stored value changes
  event ValueChanged(uint256 newValue);

  // Stores a new value in the contract
  function store(uint256 newValue) public {
    value = newValue;
    emit ValueChanged(newValue);
  }

  // Reads the last stored value
  function retrieve() public view returns (uint256) {
    return value;
  }
}
