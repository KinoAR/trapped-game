package;
import WindowBase;

import hxd.res.DefaultFont;

class MessageWindow  extends WindowBase{
  var storyText: h2d.Text;
  var textInput: h2d.TextInput;
  var debug: h2d.Text;
  var scene: h2d.Scene;

  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent, x, y, width, height);
  }

  override function init() {
    super.init();
    drawBorder(this.x, this.y, this.width, this.height);
    setupText(this.x + 30, this.y + 20);
    // setupTextInput(30, 420);
  }

  function setupText(x:Float, y:Float) {
    storyText = new h2d.Text(DefaultFont.get(), this);
    storyText.scale(1.2);
    storyText.smooth = true;
    storyText.maxWidth = 260;
    storyText.x = x;
    storyText.y = y;
    storyText.textColor = 0xFFFFFF;
    // storyText.dropShadow = {dx: 2, dy:2, color:0xAAAAAA, alpha:255};
  }

  function setupTextInput(x:Float, y:Float) {
    var font = DefaultFont.get();
    textInput = new h2d.TextInput(font, this);
    textInput.backgroundColor = 0x80808080;
    textInput.text = "This is a test message";
    trace("Added text input");
    textInput.scale(2);
    textInput.x = x;
    textInput.y = y;
    
    textInput.textColor = 0xAAAAAA;

    textInput.onFocus = (_) -> {
      textInput.textColor = 0xFFFFFF;
    }

    textInput.onFocusLost = (_) -> {
      textInput.textColor = 0xAAAAAA;
    }

  }


  public function setText(text:String) {
    storyText.text = text;
  }

  public function setInputText(text:String) {
    textInput.text = text;
  }

  public function hide(bool:Bool) {
    textInput.visible = bool;
    storyText.visible = bool;
  }
}