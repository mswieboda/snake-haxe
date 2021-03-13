package;

import flixel.FlxG;
import flixel.FlxState;
import openfl.system.System;

class PlayState extends FlxState {
  var player:Player;

  override public function create() {
    player = new Player(30, 30);
    add(player);
    super.create();
  }

  override public function update(elapsed:Float) {
    super.update(elapsed);

    if (FlxG.keys.anyJustPressed([ESCAPE])) {
      System.exit(0);
    }
  }
}
