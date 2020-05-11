package;

class WindowBase extends h2d.Graphics {
  var width: Float;
  var height: Float;
  public function new(scene:h2d.Scene, x:Float, y:Float, width:Float, height:Float) {
    super(scene);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height =height;
    init();
  }

  function init() {
    drawBorder(x, y, width, height);
  }

  function drawBorder(x:Float, y:Float, width:Float, height:Float) {
    this.lineStyle(1, 0xAAAAAA);
    this.lineTo(x, y);
    this.lineTo(x + width, y);
    this.lineTo(x+ width, y + height);
    this.lineTo(x, y + height);
    this.lineTo(x, y);
  }

  public function show(bool:Bool) {
    this.visible = bool;
  }

}