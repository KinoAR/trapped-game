package;

import js.html.TableSectionElement;
import hxd.res.DefaultFont;
import h2d.Font;
import BaseBtn;
import GameData;
import SceneManager;
import MainScene;
import CreditsScene;

class TitleScene extends h2d.Scene {
  var titleText: h2d.Text;
  var newGameBtn:BaseBtn; 
  var creditsBtn:BaseBtn;
  var exitGameBtn:BaseBtn;
  var buttonColor:Int = 0x000000;

  public function new() {
    super();
    init();
  }

  private function init() {
    var font = DefaultFont.get();
    this.titleText = new h2d.Text(font, this);
    var windowWidth = hxd.Window.getInstance().width;
    var windowHeight = hxd.Window.getInstance().height;
    this.titleText.x = (windowWidth / 2) - 35;
    this.titleText.y = 140;
    this.titleText.scale(2);
    this.titleText.text = GameData.getGameData().title;
    createNewGameBtn(windowWidth / 2, 200);
    createCreditsBtn(windowWidth /2, 250);
    createExitGameBtn(windowWidth / 2, 300);
  }

  private function createNewGameBtn(x:Float, y:Float) {
    this.newGameBtn = new BaseBtn(this, x - 35, y, 100, 50);
    this.newGameBtn.setBackgroundColor(buttonColor)
      .setText("New Game")
      .setOnClick( (event) -> {
        trace("New Game Pressed");
        this.dispose();
        SceneManager.changeScene(new MainScene());
      });
  }

  private function createCreditsBtn(x:Float, y:Float) {
    this.creditsBtn = new BaseBtn(this, x - 35, y, 100, 50);
    this.creditsBtn.setBackgroundColor(buttonColor)
      .setText("Credits")
      .setOnClick((event) -> {
        trace("Credits Pressed");
        SceneManager.changeScene(new CreditsScene());
      });
  }

  private function createExitGameBtn(x:Float, y:Float) {
    this.exitGameBtn = new BaseBtn(this, x - 35, y, 100, 50);
    this.exitGameBtn.setBackgroundColor(buttonColor)
      .setText("Exit Game")
      .setOnClick((event) -> {
        trace("Exit Game Pressed");
      });
  }
}