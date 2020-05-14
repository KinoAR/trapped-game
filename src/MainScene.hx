package;
import SceneManager;
import GameData;
import h2d.Text;
import hxd.res.DefaultFont;
import MainWindow;

class MainScene extends h2d.Scene {
  var mainWindow:MainWindow; 
  var interaction:h2d.Interactive;

  public function new() {
    super();
    init();
  }

  private function init() {
    this.mainWindow = new MainWindow(this);
    var width = this.mainWindow.messageWindow.width;
    var height = this.mainWindow.messageWindow.height;
    this.interaction = new h2d.Interactive(width, height, this.mainWindow.messageWindow);
    setupOnClick();
  }

  private function setupOnClick() {
    hxd.Window.getInstance().addEventTarget((event) -> {
      switch(event.kind) {
        case EPush:
          trace("Clicked message window");
        case _:
      }
    });
  }

}