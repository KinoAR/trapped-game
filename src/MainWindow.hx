
import MessageWindow;
import GraphicWindow;
import HudWindow;
import Types;

class MainWindow extends WindowBase {
  public var hudWindow:HudWindow;
  public var messageWindow:MessageWindow;
  public var graphicWindow:GraphicWindow;

  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent, x, y, width, height);
  }

  public override function init() {
    messageWindow = new MessageWindow(this, 10, 190, 350, 350);
    graphicWindow = new GraphicWindow(this, 10, 10, 350, 350);
    hudWindow = new HudWindow(this, 8, 8 , 344, 50);
    sendCommand(ShowText("Welcome to the show"));
    trace(hxd.Res.example.entry);
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
      case Wait(seconds):
        //Pass
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

  public override function show(bool:Bool) {
    hudWindow.show(bool);
    messageWindow.show(bool);
    graphicWindow.show(bool);
  }
}