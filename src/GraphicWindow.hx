package;

class GraphicWindow {
  var scene: h2d.Scene;

  public function new(scene:h2d.Scene) {
    this.scene = scene;
    init();
  }

  public function init() {
    drawBackground(11, 11);
    drawBorder(10, 10);
  }

  function drawBackground(x:Float, y:Float) {
    var background = new h2d.Graphics(scene);
    background.beginFill(0xAAAAAA);
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


  public function setGraphic() {

  }

  public function clearWindow() {

  }
}