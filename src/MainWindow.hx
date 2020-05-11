
import MessageWindow;
import GraphicWindow;
import HudWindow;
import Types;

class MainWindow {
  var hudWindow:HudWindow;
  var messageWindow:MessageWindow;
  var graphicWindow:GraphicWindow;

  public function new(scene: h2d.Scene) {
    messageWindow = new MessageWindow(scene, 10, 190, 350, 350);
    graphicWindow = new GraphicWindow(scene, 10, 10, 350, 350);
    hudWindow = new HudWindow(scene, 8, 8 , 344, 50);
    init();
  }

  public function init() {
    sendCommand(ShowText("Welcome to the show"));
    sendCommand(ChangeGraphic(hxd.Res.zipper4.toTile()));
  }

  function update() {

  }

  public function sendCommand(command:SysCommands) {
    switch(command) {
      case ShowText(str):
        showStoryText(str);
      case ChangeGraphic(tile):
        showGraphic(tile);
      case CloseWindow:
        show(false);
      case ShowWindow:
        show(true);
    }
  }

  public function setCondition(condition:Condition) {
    hudWindow.setCondition(condition);
  }

  public function showGraphic(image:h2d.Tile) {
    graphicWindow.setGraphic(image);
  }

  public function showStoryText(text:String) {
    messageWindow.setText(text);
  }

  public function show(bool:Bool) {
    hudWindow.show(bool);
    messageWindow.show(bool);
    graphicWindow.show(bool);
  }
}