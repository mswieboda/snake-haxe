package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import snake.Global;
import snake.Global.Direction;

class Player extends FlxSprite {
  static inline final SPEED_INCREASE = 10;
  static inline final SPEED_INITIAL = 50;

  var speed: Int = SPEED_INITIAL;
  var directions: Array<Direction> = [];

  public function new(x: Float = 0, y: Float = 0) {
    super(x, y);
    makeGraphic(Global.GRID_SIZE, Global.GRID_SIZE, FlxColor.LIME);
  }

  override function update(elapsed: Float) {
    updateMovement();
    super.update(elapsed);
  }

  function updateMovement() {
    var up: Bool = false;
    var down: Bool = false;
    var left: Bool = false;
    var right: Bool = false;

    up = FlxG.keys.anyJustPressed([UP, W]);
    down = FlxG.keys.anyJustPressed([DOWN, S]);
    left = FlxG.keys.anyJustPressed([LEFT, A]);
    right = FlxG.keys.anyJustPressed([RIGHT, D]);

    if (up && down) up = down = false;
    if (left && right) left = right = false;

    if (up || down) {
      directions.push(up ? Up : Down);
    } else if (left || right) {
      directions.push(left ? Left : Right);
    }

    if (directions.length > 0 && canTurn()) {
      var direction = directions.shift();
      x = Math.floor(x);
      y = Math.floor(y);

      if (direction == Up || direction == Down) {
        velocity.x = 0;
        velocity.y = direction == Down ? speed : -speed;
      } else {
        velocity.x = direction == Right ? speed : -speed;
        velocity.y = 0;
      }
    }
  }

  function canTurn() {
    return Math.floor(x) % Global.GRID_SIZE == 0 && Math.floor(y) % Global.GRID_SIZE == 0;
  }

  public function eatFood() {
    trace(">>> bro, we got some food!");
    speed += SPEED_INCREASE;
  }
}
