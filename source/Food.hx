package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import snake.Global;

class Food extends FlxSprite {
  public function new(x: Float = 0, y: Float = 0) {
    super(x, y);
    makeGraphic(Global.GRID_SIZE, Global.GRID_SIZE, FlxColor.RED);
  }

  override function update(elapsed: Float) {
    super.update(elapsed);
  }

  public function newRandomSpot() {
    var rect = FlxG.worldBounds;
    setPosition(randomSnappedToGrid(rect.right), randomSnappedToGrid(rect.bottom));
  }

  private function randomSnappedToGrid(max: Float) {
    var n = Math.random() * Math.floor(max / Global.GRID_SIZE);
    return Math.floor(n / Global.GRID_SIZE) * Global.GRID_SIZE;
  }
}
