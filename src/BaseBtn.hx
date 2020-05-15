import format.abc.Data.Function;
import h2d.Text;
import hxd.res.DefaultFont;

class BaseBtn extends h2d.Graphics {
  var text: h2d.Text;
  var background: h2d.Graphics;
  var textColor:Int;
  var backgroundColor:Int;
  var width:Float;
  var height:Float;
  var interaction:h2d.Interactive;

  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.interaction = new h2d.Interactive(this.width, this.height, this);
    init();
  }
  
  private function init() {
    createBackground(0, 0);
    createText(10,10);
  }

  private function createBackground(x:Float, y:Float) {
    this.background = new h2d.Graphics(this);
    this.background.x = x;
    this.background.y = y;
  }

  private function createText(x:Float, y:Float) {
    var font = DefaultFont.get();
    this.text = new h2d.Text(font, this);
    this.text.x = x;
    this.text.y = y;
    this.text.scale(1.5);
  }

  public function setBackgroundColor(color:Int) {
    this.backgroundColor =  color;
    drawBackground();
    return this;
  }

  public function drawBackground() {
    this.background.beginFill(this.backgroundColor);
    this.background.drawRect(this.background.x, this.background.y, this.width, this.height);
    this.background.endFill();
  }

  public function setText(text:String) {
    this.text.text = text;
    return this;
  }

  public function setOnClick(fn: (e:hxd.Event) -> Void) {
    this.interaction.onClick = fn;
  }
}
