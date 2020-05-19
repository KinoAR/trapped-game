import js.html.GamepadEvent;
import h2d.filter.DropShadow;
import h2d.filter.ColorMatrix;
import h2d.filter.Ambient;
import h2d.filter.Group;
import h2d.filter.Glow;
import hxd.Math;  
import TitleScene;
import CreditsScene;
import GameData;
import SceneManager;
import EventListener;

class Main extends hxd.App {
  var gameData:GameData;
  var titleScene:TitleScene;
  var creditsScene:CreditsScene;

  override function loadAssets(onLoaded) {
    GameData.initializeGameData();
    GameData.onGameLoad = () -> {
      onLoaded();
      trace(GameData.getGameData());
    };
  }

  override function init() {
    engine.backgroundColor = 0x202020;
    hxd.Window.getInstance().resize(500, 500);
    hxd.Res.initEmbed();
    SceneManager.changeScene = setScene2D;
    createScenes();
    SceneManager.changeScene(titleScene);
    //Create a custom graphics object by passing a 2d scene reference
    //Graphics, act like containers, can have colors, gradients or custom bitmaps
   
  }

  function createScenes() {
    this.titleScene = new TitleScene();
    this.creditsScene = new CreditsScene();
  }
  //On each Frame
  override function update(delta: Float) {
    EventListener.emitSignal("update");
    // increment the display bitmap rotation by 0.1 radians
    
  }

  static function main() {
    new Main();
  }
}