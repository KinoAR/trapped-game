
import MessageWindow;
import GraphicWindow;

class MainWindow {
  var messageWindow:MessageWindow;
  var graphicWindow:GraphicWindow;

  public function new(scene: h2d.Scene) {
    messageWindow = new MessageWindow(scene);
    graphicWindow = new GraphicWindow(scene);
  }

  function update() {

  }
}