import format.abc.Data.Function;
import h2d.Text;
import hxd.res.DefaultFont;

class BaseBtn extends h2d.Graphics {
  var text: h2d.Text;
  var background: h2d.Graphics;
  var textColor:Int;
  var initialBackgroundColor:Int;
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
    drawBorder(0, 0, this.width, this.height);
    createBackground(1, 0);
    createText(10,10);
    this.interaction.onOver = (event) -> {
      this.initialBackgroundColor = this.backgroundColor;
      this.backgroundColor = 0x2F2F2F;
      this.drawBackground();
    };
    this.interaction.onOut = (event) -> {
      this.backgroundColor = this.initialBackgroundColor;
      this.drawBackground();
    };
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

  function drawBorder(x:Float, y:Float, width:Float, height:Float) {
    this.lineStyle(1, 0xAAAAAA);
    this.lineTo(x, y);
    this.lineTo(x + width, y);
    this.lineTo(x+ width, y + height);
    this.lineTo(x, y + height);
    this.lineTo(x, y);
  }

  public function setBackgroundColor(color:Int) {
    this.backgroundColor =  color;
    drawBackground();
    return this;
  }

  public function drawBackground() {
    this.background.beginFill(this.backgroundColor);
    this.background.drawRect(this.background.x, this.background.y, this.width - 2, this.height - 1);
    this.background.endFill();
  }

  public function setText(text:String) {
    this.text.text = text;
    return this;
  }

  public function setOnClick(fn: (e:hxd.Event) -> Void) {
    this.interaction.onClick = fn;
    return this;
  }
}
