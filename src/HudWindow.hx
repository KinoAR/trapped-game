import hxd.res.DefaultFont;
import Types;


class HudWindow {
  var conditionText: h2d.Text;
  var days:Int;
  var dayText: h2d.Text;
  var scene: h2d.Scene;
  var background: h2d.Graphics;


  public function new(scene:h2d.Scene) {
    this.scene = scene;
    init();
  }

  function init() {
    drawHUDBackground(6, 6);
    setupCondition(10, 10);
    setupDays(50, 0);
  }

  function  drawHUDBackground(x:Float, y:Float) {
    background = new h2d.Graphics(scene);
    background.x = x;
    background.y = y;
    background.beginFill(0x0202020);
    background.drawRect(x, y, 344, 50);
    background.endFill();
  }

  function setupCondition(x:Float, y:Float) {
    var font = hxd.res.DefaultFont.get();
    conditionText = new h2d.Text(font, scene);
    conditionText.x = background.x + x;
    conditionText.y = background.y + y;
    conditionText.scale(1.5);
    conditionText.smooth = true;
    setCondition(Good);
  }

  function setupDays(x:Float, y:Float) {
    var font = DefaultFont.get();
    dayText = new h2d.Text(font, scene);
    dayText.x = conditionText.x + x;
    dayText.y = conditionText.y + y;
    dayText.textColor = 0xFFFFFF;
    dayText.smooth = true;
    dayText.scale(1.5);
    setDays(0);
  }
  
  public function setCondition(condition:Condition) {
    switch(condition) {
      case Good:
        conditionText.text = "Good";
        conditionText.textColor = 0xDAF7A6;
      case Average:
        conditionText.text  = "Average";
        conditionText.textColor = 0xFFC300;
      case Bad:
        conditionText.text  = "Bad";
        conditionText.textColor = 0xFF5733;
    }
    trace(conditionText.textColor);
  }

  public function setDays(days:Int) {
    dayText.text = "Days: " + days;
  }

  public function hide(bool: Bool) {
    conditionText.visible = bool;
    dayText.visible = bool;
    background.visible = bool;
  }
}