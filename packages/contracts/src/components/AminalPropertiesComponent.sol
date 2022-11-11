// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "std-contracts/components/Component.sol";

uint256 constant ID = uint256(keccak256("component.AminalProperties"));

contract AminalPropertiesComponent is Component {
  struct AminalStruct {
    address favorite;
    address coordinates;
    uint256 totalFed;
    uint256 totalMoved;
    // We can calculate hunger based on lastFed.
    uint256 lastFed;
    // We can have a fun multiplier like "lastExercised" if we wanted to for
    // the gotos. That would require them to state the max movement they
    // want to occur and be refunded for any unpurchased movements.
    uint256 lastMoved;
    uint256 lastPooped;
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

  constructor(address world) Component(world, ID) {}
}
