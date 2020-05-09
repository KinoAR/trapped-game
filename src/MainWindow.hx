
import MessageWindow;
import GraphicWindow;
import HudWindow;

class MainWindow {
  var hudWindow:HudWindow;
  var messageWindow:MessageWindow;
  var graphicWindow:GraphicWindow;

  public function new(scene: h2d.Scene) {
    messageWindow = new MessageWindow(scene);
    graphicWindow = new GraphicWindow(scene);
    hudWindow = new HudWindow(scene);
  }

  function update() {

  }

  public function hide(bool:Bool) {
    hudWindow.hide(bool);
    messageWindow.hide(bool);
    graphicWindow.hide(bool);
  }
}