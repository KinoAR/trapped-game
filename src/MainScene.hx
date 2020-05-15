package;
import SceneManager;
import GameData;
import h2d.Text;
import hxd.res.DefaultFont;
import MainWindow;

class MainScene extends h2d.Scene {
  var mainWindow:MainWindow; 
  var interaction:h2d.Interactive;
  var commands:Array<Command>;

  public function new() {
    super();
    init();
  }

  private function init() {
    var windowWidth = hxd.Window.getInstance().width;
    this.mainWindow = new MainWindow(this, windowWidth / 2 - 175, 0, 0, 0 );
    var width = this.mainWindow.messageWindow.width;
    var height = this.mainWindow.messageWindow.height;
    this.interaction = new h2d.Interactive(width, height, this.mainWindow.messageWindow);
    this.commands = GameData.getGameData().scenes[0].commands;
    this.mainWindow.setCommands(this.commands);
    setupOnClick();
  }

  private function setupOnClick() {
    hxd.Window.getInstance().addEventTarget((event) -> {
      switch(event.kind) {
        case EPush:
          trace("Clicked message window");
          this.mainWindow.updateCommand();
        case _:
      }
    });
  }

}