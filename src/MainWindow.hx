
import GameData.Command;
import MessageWindow;
import GraphicWindow;
import HudWindow;
import Types;

class MainWindow extends WindowBase {
  public var hudWindow:HudWindow;
  public var messageWindow:MessageWindow;
  public var graphicWindow:GraphicWindow;
  public var commands: Array<Command>;
  public var commandIndex:Int;

  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent, x, y, width, height);
  }

  public override function init() {
    this.commandIndex = -1;
    messageWindow = new MessageWindow(this, 10, 190, 350, 350);
    graphicWindow = new GraphicWindow(this, 10, 10, 350, 350);
    hudWindow = new HudWindow(this, 8, 8 , 344, 50);
    sendCommand(ShowText("Welcome to the show"));
    sendCommand(ChangeGraphic(hxd.Res.zipper4.toTile()));
  }

  function update() {

  }

  public function isPlayingText() {
    return this.messageWindow.isPlayingText;
  }
  
  public function showAllText() {
    this.messageWindow.showAllText();
  }

  public function updateCommand(value:Int) {
    this.commandIndex+=value;
    if(this.commandIndex > -1 
      && this.commandIndex < this.commands.length) {
        var command = this.commands[this.commandIndex];
        trace("Updated Command - index: " + this.commandIndex);
          sendCommand(Utilities.createCommand(command)); 
    }
      
   this.commandIndex = cast(Utilities.clamp(this.commandIndex, 0, this.commands.length), Int);
   trace(this.commandIndex);
  }

  public function sendCommand(command:SysCommands) {
    switch(command) {
      case ShowText(str):
        showStoryText(str);
      case ChangeGraphic(tile):
        showGraphic(tile);
        if (this.commands != null)
          updateCommand(1);
      case SetDays(days):
        this.hudWindow.setDays(days);
        updateCommand(1);
      case Wait(seconds):
        //Pass
      case CloseWindow:
        show(false);
      case ShowWindow:
        show(true);
      case _:
        //Do nothing
    }
  }

  public function setCommands(commands: Array<Command>) {
    trace(this.commands);
    this.commands = commands;
  }

  public function setCondition(condition:Condition) {
    hudWindow.setCondition(condition);
  }

  public function showGraphic(image:h2d.Tile) {
    graphicWindow.setGraphic(image);
  }

  public function showStoryText(text:String) {
    messageWindow.startText(text);
  }

  public override function show(bool:Bool) {
    hudWindow.show(bool);
    messageWindow.show(bool);
    graphicWindow.show(bool);
  }
}