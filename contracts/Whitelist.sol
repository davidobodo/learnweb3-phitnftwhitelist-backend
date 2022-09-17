//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {
    uint8 public maxWhiltelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    // To set the maximu number of whitelisted addresses. I would input this value at the time of deployment
    constructor (uint8 _maxWhitelistedAddresses){
        maxWhiltelistedAddresses = _maxWhitelistedAddresses;
    }


    function addAddressToWhitelist()public {
        require(!whitelistedAddresses[msg.sender] , "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhiltelistedAddresses, "More addresses cant be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted +=1;
    }
}