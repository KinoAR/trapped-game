package;

import hxd.res.DefaultFont;
import h2d.Font;
import BaseBtn;
import GameData;
import SceneManager;
import TitleScene;

class CreditsScene extends h2d.Scene {
  var titleText: h2d.Text;
  var creditsText: h2d.Text;
  var returnToTitleBtn:BaseBtn; 
  var exitGameBtn:BaseBtn;
  var buttonColor:Int = 0x000000;

  public function new() {
    super();
    init();
  }

  private function init() {
    var font = DefaultFont.get();
    this.titleText = new h2d.Text(font, this);
    this.creditsText = new h2d.Text(font, this);
    var windowWidth = hxd.Window.getInstance().width;
    var windowHeight = hxd.Window.getInstance().height;
    this.titleText.x = (windowWidth / 2) - 35;
    this.titleText.y = 140;
    this.titleText.scale(2);
    this.titleText.text = "Credits";
    createNewGameBtn(windowWidth / 2, 200);
    createExitGameBtn(windowWidth / 2, 250);
    setCreditsText(windowWidth / 2 - 35, 300);
  }

  private function setCreditsText(x:Float, y:Float) {
    this.creditsText.text = "Nier Pixel\nMade by Kino Rose";
    this.creditsText.x = x;
    this.creditsText.y = y;
  }

  private function createNewGameBtn(x:Float, y:Float) {
    this.returnToTitleBtn = new BaseBtn(this, x - 55, y, 150, 50);
    this.returnToTitleBtn.setBackgroundColor(buttonColor)
      .setText("Return To Title")
      .setOnClick( (event) -> {
        trace("Return To Title Pressed");
        this.dispose();
        SceneManager.changeScene(new TitleScene());
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