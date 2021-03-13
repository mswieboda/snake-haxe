package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState {
  var playButton:FlxButton;

  override public function create() {
    var text = new FlxText(0, 0, 0, "snake", 32);
    text.screenCenter();
    add(text);

    playButton = new FlxButton(0, 0, "play", clickPlay);
    playButton.screenCenter();
    playButton.setPosition(playButton.x, playButton.y + 100);
    add(playButton);

    super.create();
  }

  override public function update(elapsed:Float) {
    super.update(elapsed);
  }

  function clickPlay() {
    FlxG.switchState(new PlayState());
  }
}
