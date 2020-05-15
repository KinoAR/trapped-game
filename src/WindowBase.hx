package;

class WindowBase extends h2d.Graphics {
  public var width: Float;
  public var height: Float;
  public function new(parent:h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent);
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