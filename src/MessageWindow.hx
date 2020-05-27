package;
import WindowBase;

import hxd.res.DefaultFont;
using Lambda;

class MessageWindow  extends WindowBase{
  var storyText: h2d.Text;
  var nameText: h2d.Text;
  public var textData:String;
  var textInput: h2d.TextInput;
  var debug: h2d.Text;
  var scene: h2d.Scene;
  var nextArrow: h2d.Bitmap;
  var accumulator: Float;
  var arrowPosX:Float;
  var seenText: Array<String>;
  public var isPlayingText:Bool;

  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent, x, y, width, height);
  }

  override function init() {
    super.init();
    drawBorder(this.x, this.y, this.width, this.height);
    setupNameText(this.x + 30, this.y + 20);
    setupText(this.x + 30, this.y + 45);
    setupNextArrow(this.x + 305, this.y + 300);
    this.isPlayingText = false;
    // setupTextInput(30, 420);
  }

  function setupNameText(x:Float, y:Float) {
    nameText = new h2d.Text(DefaultFont.get(), this);
    nameText.scale(1.5);
    nameText.smooth = true;
    nameText.maxWidth = 20;
    nameText.x = x;
    nameText.y = y;
    nameText.textColor = 0xFFFFFF;
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

  function setupNextArrow(x:Float, y:Float) {
     nextArrow = new h2d.Bitmap(hxd.Res.next_arrow2x.toTile(), this);
     nextArrow.x = x;
     nextArrow.y = y;
     arrowPosX = nextArrow.x;
     nextArrow.visible = false;
  }

  function setupTextInput(x:Float, y:Float) {
    var font = DefaultFont.get();
    textInput = new h2d.TextInput(font, this);
    textInput.backgroundColor = 0x80808080;
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

  public function setNameText(text:String) {
    this.nameText.text = '${text}:';
  }
  
  public function clearNameText() {
    this.nameText.text = "";
  }

  public function setText(text:String) {
    this.storyText.text = text;
  }

  public function showAllText() {
    this.setText(this.textData);
  }

  public function stopNextArrow() {
    this.nextArrow.visible = false;
  }

  public function startNextArrow() {
    this.nextArrow.visible = true;
    EventListener.clearHooks("nextArrowUpdate");
    accumulator = 0.0;
    EventListener.addEvent("nextArrowUpdate", () -> {
      if(nextArrow.visible == false) {
        EventListener.clearHooks("nextArrowUpdate");
      } else {
        accumulator += hxd.Timer.elapsedTime * 6;
        nextArrow.x = arrowPosX + Math.sin(accumulator) * 5;
      }
    });

  }

  function handleSeenText(text:String) {
    if(seenText.has(text)) {
      storyText.textColor = 0xADD8E6;
    } else {
      storyText.textColor = 0xFFFFFF;
    }
  }

  public function startText(text:String) {
    EventListener.clearHooks("textUpdate");
    textData = text;
    storyText.text = "";
    var timeFrame = .0125;
    var seconds = timeFrame;
    var index = 0;
    handleSeenText(textData);
    //Should track input and if user clicks again, show all Text
    // Will have to change input event tracking and add indicator
    EventListener.addEvent("textUpdate", () -> {
      this.isPlayingText = true;
      if(storyText.text == textData)  {
        this.isPlayingText = false;
        this.startNextArrow();
        seenText.push(textData);
        EventListener.clearHooks("textUpdate");
      }
       else {
        if(seconds <= 0) {
          storyText.text += textData.charAt(index);
          seconds = timeFrame;
          index++;
        } else {
          seconds-= hxd.Timer.elapsedTime;
        }
       }
    });
  }

  public function setInputText(text:String) {
    textInput.text = text;
  }

  public function hide(bool:Bool) {
    textInput.visible = bool;
    storyText.visible = bool;
  }
}