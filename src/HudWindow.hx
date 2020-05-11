import hxd.res.DefaultFont;
import Types;


class HudWindow  extends WindowBase {
  var conditionText: h2d.Text;
  var days:Int;
  var dayText: h2d.Text;
  var scene: h2d.Scene;
  var background: h2d.Graphics;


  public function new(scene:h2d.Scene, x:Float, y:Float, width:Float, height:Float) {
    super(scene, x, y, width, height);
    init();
  }

  override function init() {
    drawHUDBackground(this.x + 6, this.y + 6);
    setupCondition(this.x + 10, this.y + 10);
    setupDays(this.x + 50, 0);
  }

  function  drawHUDBackground(x:Float, y:Float) {
    this.beginFill(0x0202020);
    this.drawRect(x, y, this.width, this.height);
    this.endFill();
  }

  function setupCondition(x:Float, y:Float) {
    var font = hxd.res.DefaultFont.get();
    conditionText = new h2d.Text(font, this);
    conditionText.x = x;
    conditionText.y = y;
    conditionText.scale(1.5);
    conditionText.smooth = true;
    setCondition(Good);
  }

  function setupDays(x:Float, y:Float) {
    var font = DefaultFont.get();
    dayText = new h2d.Text(font, this);
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