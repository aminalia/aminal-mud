// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import "solecs/System.sol";
import { IWorld } from "solecs/interfaces/IWorld.sol";
import { IUint256Component } from "solecs/interfaces/IUint256Component.sol";
import { IComponent } from "solecs/interfaces/IComponent.sol";
import { getAddressById, addressToEntity } from "solecs/utils.sol";

import { LibUtils } from "std-contracts/libraries/LibUtils.sol";
import { PositionComponent, ID as PositionComponentID, Coord } from "../components/PositionComponent.sol";
import { AffectionComponent, ID as AffectionComponentID } from "../components/AffectionComponent.sol";

uint256 constant ID = uint256(keccak256("system.Feed"));

contract FeedSystem is System {
  constructor(IWorld _world, address _components) System(_world, _components) {}

  function execute(bytes memory arguments) public returns (bytes memory) {
    (uint256 entity, uint256 value) = abi.decode(arguments, (uint256, uint256));

    AffectionComponent affection = AffectionComponent(getAddressById(components, AffectionComponentID));

    affection.set(entity, affection.getValue(entity) + value);
  }

  function executeTyped(uint256 entity) public payable returns (bytes memory) {
    return execute(abi.encode(entity, msg.value));
  }
}
