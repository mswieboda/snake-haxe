package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.util.FlxSort;
import openfl.system.System;

class PlayState extends FlxState {
  var player: Player;
  var food: Food;

  override public function create() {
    food = new Food(320, 320);
    add(food);

    player = new Player(32, 32);
    add(player);

    super.create();
  }

  override public function update(elapsed: Float) {
    super.update(elapsed);

    // TODO: make a hitbox for food
    //       that's smaller than itself so snake eats half of it, etc
    if (player.overlaps(food)) {
      player.eatFood();
      food.newRandomSpot();
    }

    if (FlxG.keys.anyJustPressed([ESCAPE])) {
      System.exit(0);
    }
  }
}
