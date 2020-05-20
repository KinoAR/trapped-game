package;
import hxd.Key;
import hxd.Event;
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
    trace(this.commands);
    setupOnClick();
  }

  private function setupOnClick() {
    hxd.Window.getInstance().addEventTarget((event) -> {
      switch(event.kind) {
        case ERelease:
          switch(event.button) {
            case hxd.Key.MOUSE_LEFT:
              //Prevents Text Advancement Unless All Text Shown
              if(this.mainWindow.isPlayingText()) {
                this.mainWindow.showAllText();
              } else {
                this.mainWindow.updateCommand(1);
              }
            case hxd.Key.MOUSE_RIGHT:
              this.mainWindow.updateCommand(-1);
            case _:
              //Do nothing
          }
        case _:
         //Do nothing
      }
    });
  }

}