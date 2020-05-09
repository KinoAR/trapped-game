package;

import MainWindow;

class TestScene extends h2d.Scene {
  var tf:h2d.Text;
  var bmp : h2d.Bitmap;
  var startRotation = false;
  var customGraphics: h2d.Graphics;

  public function new() {
    super();
    init();
  }
  
  function init() {
    var mainWindow = new MainWindow(this);
  }


  function addEventToBitmap (bitmap: h2d.Bitmap) {
    var interaction = new h2d.Interactive(bitmap.tile.width, bitmap.tile.height, bitmap);

    interaction.onClick = (event: hxd.Event) -> {
      bitmap.alpha = 0.5;
      bitmap.tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
      bmp.tile.dx = -50;
      bmp.tile.dy = -50;
      startRotation = !startRotation;
    };

    interaction.onOut = (event: hxd.Event) -> {
      bitmap.alpha = 1.0;
      bmp.tile.dx = -50;
      bmp.tile.dy = -50;
    };
  }

}