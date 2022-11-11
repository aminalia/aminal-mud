// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "std-contracts/components/Component.sol";

uint256 constant ID = uint256(keccak256("component.AminalProperties"));

contract AminalPropertiesComponent is Component {
  struct AminalStruct {
    address favorite;
    uint256 totalFed;
    uint256 totalMoved;
    uint256 lastFed;
    uint256 lastMoved;
    // This data will not be updated after spawn
    uint256 spawnTime;
    address spawnedBy;
    address spawnedAt;
    // We don't need to track the highest fed or goto amount because we can
    // get that by quering the mappings for the favorite address
    mapping(address => uint256) fedPerAddress;
    mapping(address => uint256) movedPerAddress;
  }

  // Mapping of Aminal IDs to Aminal structs
  mapping(uint256 => AminalStruct) aminalProperties;

  constructor(address world) Component(world, ID) {
    function setFed(address world, address fedBy, address fedAmount) {

    }

    function setMoved(address world, address movedBy, address movedAmount) {

    }

    function setSpawned(address world, address spawnedBy, address spawnedAt) {

    }
  }
}
