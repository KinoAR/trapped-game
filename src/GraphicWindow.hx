package;

import h2d.Text;
import hxd.res.DefaultFont;

class GraphicWindow extends WindowBase {
  var scene: h2d.Scene;
  var storyText: h2d.Text;
  var storyGraphic: h2d.Graphics;
  var background: h2d.Graphics;

  public function new(scene:h2d.Scene, x:Float, y:Float, width:Float, height:Float) {
    super(scene, x, y, width, height);
    init();
  }

   override function init() {
    super.init();
    drawBackground(this.x + 1, this.y + 1, 0xAAAAAA);
    setupGraphic(this.x, this.y);
    setupTextInput(this.x + 5, this.y + 10);
  }

  function drawBackground(x:Float, y:Float, color:Int) {
    this.beginFill(color);
    this.drawRect(x, y, 347, 347);
    this.endFill();
  }

  function setupGraphic(x:Float, y:Float) {
    storyGraphic = new h2d.Graphics(this);
    storyGraphic.x = x;
    storyGraphic.y = y;
  }

  function setupTextInput(x:Float, y:Float) {
    var font = DefaultFont.get();
    storyText = new h2d.Text(font, this);
    storyText.x = x;
    storyText.y = y;
    storyText.scale(1.2);
    storyText.textColor = 0xFFFFFF;
  }

  public function setGraphic(image: h2d.Tile) {
    storyGraphic.clear();
    storyGraphic.drawTile(this.x, this.y, image);
    var scaleAmount = this.width / storyGraphic.tile.width;
    storyGraphic.scale(scaleAmount / 2);
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
}