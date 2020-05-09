import h2d.filter.DropShadow;
import h2d.filter.ColorMatrix;
import h2d.filter.Ambient;
import h2d.filter.Group;
import h2d.filter.Glow;
import hxd.Math;  
import TestScene;

class Main extends hxd.App {
  

  override function init() {
    engine.backgroundColor = 0x202020;

    //Create a custom graphics object by passing a 2d scene reference
    //Graphics, act like containers, can have colors, gradients or custom bitmaps
    setScene2D(new TestScene());
  }

  //On each Frame
  override function update(delta: Float) {
    // increment the display bitmap rotation by 0.1 radians
    
  }

  static function main() {
    new Main();
  }
}