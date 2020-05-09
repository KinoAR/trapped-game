package;

import hxd.res.DefaultFont;

class MessageWindow {
  var storyText: h2d.Text;
  var textInput: h2d.TextInput;
  var debug: h2d.Text;
  var scene: h2d.Scene;

  public function new(scene: h2d.Scene) {
    this.scene = scene;
    init();
  }

  function init() {
    drawBorder(10, 360);
    setupText(30, 380);
    setupTextInput(30, 420);
  }

  function drawBorder(x:Float, y:Float) {
    var border = new h2d.Graphics(scene);
    var width = 350;
    var height = 400;
    border.lineStyle(1, 0xAAAAAA);
    border.lineTo(x, y);
    border.lineTo(x + width, y);
    border.lineTo(x+ width, y + height);
    border.lineTo(x, y + height);
    border.lineTo(x, y);
  }

  function setupText(x:Float, y:Float) {
    storyText = new h2d.Text(DefaultFont.get(), scene);
    storyText.scale(2);
    storyText.text = "Story Text";
    storyText.x = x;
    storyText.y = y;
    storyText.textColor = 0xFFFFFF;
    storyText.dropShadow = {dx: 2, dy:2, color:0xAAAAAA, alpha:255};
  }

  function setupTextInput(x:Float, y:Float) {
    var font = DefaultFont.get();
    textInput = new h2d.TextInput(font, scene);
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
}