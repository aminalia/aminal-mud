import { tileCoordToPixelCoord } from "@latticexyz/phaserx";
import { defineComponentSystem } from "@latticexyz/recs";
import { NetworkLayer } from "../../network";
import { Sprites } from "../constants";
import { PhaserLayer } from "../types";

export function createPositionSystem(network: NetworkLayer, phaser: PhaserLayer) {
  const {
    world,
    components: { Position },
  } = network;

  const {
    scenes: {
      Main: {
        objectPool,
        config,
        maps: {
          Main: { tileWidth, tileHeight },
        },
      },
    },
  } = phaser;

  defineComponentSystem(world, Position, (update) => {
    const position = update.value[0];
    if (!position) {
      objectPool.remove(update.entity);
      // Position got removed
      return;
    }

    const object = objectPool.get(update.entity, "Sprite");
    const { x, y } = tileCoordToPixelCoord(position, tileWidth, tileHeight);
    const seed = Math.ceil(Math.random() * 100) % 2;
    console.log({ seed });

    const sprite = seed === 0 ? config.sprites[Sprites.Donkey] : config.sprites[Sprites.Hero];
    // const sprite = config.sprites[Sprites.Hero]

    object.setComponent({
      id: Position.id,
      once: (gameObject) => {
        gameObject.setTexture(sprite.assetKey, sprite.frame);
        gameObject.setPosition(x, y);
      },
    });
  });
}
