// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of addresses that can be whitelisted
    uint8 public maxWhitelistedAddresses;
    //mapping of whitelisted addresses
    mapping(address => bool) public whitelistedAdresses;
    //number of addresses whitelisted
    uint8 public numAddressesWhitelisted;

    //Set maximum number of addresses that can be whitelisted
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //Function to add an address to the whitelist
    function addAddressToWhitelist() public {
        require(
            !whitelistedAdresses[msg.sender],
            "Address already whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Max number of addresses already whitelisted"
        );
        whitelistedAdresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}
