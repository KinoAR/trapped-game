package;

import h2d.Text;
import hxd.res.DefaultFont;

class GraphicWindow {
  var scene: h2d.Scene;
  var storyText: h2d.Text;
  var storyGraphic: h2d.Graphics;
  var background: h2d.Graphics;

  public function new(scene:h2d.Scene) {
    this.scene = scene;
    init();
  }

  public function init() {
    drawBackground(11, 11, 0xAAAAAA);
    drawBorder(10, 10);
    setupGraphic(10, 10);
    setupTextInput(15, 20);
  }

  function drawBackground(x:Float, y:Float, color:Int) {
    background = new h2d.Graphics(scene);
    background.beginFill(color);
    background.drawRect(x, y, 347, 347);
    background.endFill();
  }

  function drawBorder(x:Float, y:Float) {
    var border = new h2d.Graphics(scene);
    var width = 350;
    var height = 350;
    border.lineStyle(1, 0xAAAAAA);
    border.lineTo(x, y);
    border.lineTo(x + width, y);
    border.lineTo(x+ width, y + height);
    border.lineTo(x, y + height);
    border.lineTo(x, y);
  }

  function setupGraphic(x:Float, y:Float) {
    storyGraphic = new h2d.Graphics(scene);
    storyGraphic.x = x;
    storyGraphic.y = y;
  }

  function setupTextInput(x:Float, y:Float) {
    var font = DefaultFont.get();
    storyText = new h2d.Text(font, scene);
    storyText.x = x;
    storyText.y = y;
    storyText.scale(1.2);
    storyText.textColor = 0xFFFFFF;
  }

  public function setGraphic() {
    storyGraphic.clear();
  }

  public function setBackgroundColor(color:Int) {
    background.clear();
    drawBackground(10, 10, color);
  }

  public function clearWindow() {
    storyText.text = "";
    storyGraphic.clear();
  }

  public function setStoryText(text:String) {
    storyText.text = text;
  }

  public function hide(bool:Bool) {
    storyGraphic.visible = bool;
    storyText.visible = bool;
    background.visible = bool;
  }
}