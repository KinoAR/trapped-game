import Types.Condition;
import haxe.io.Bytes;
import hxd.net.BinaryLoader;
import  haxe.Json;
import haxe.ds.Option;

typedef Story = {
  var title:String;
  var scenes:Array<Scene>;
}

typedef Scene = {
  var name:String;
  var commands: Array<Command>;
}

typedef Command = {
  var name:String;
  var args: Array<Dynamic>; //Dynamic so we can handle the commands without conversions
}


class GameData {
  static var rawGameData: String; 
  public static var parsedGameData:Story;
  public static var scenes: Array<Scene>;
  public static var isLoaded = false;
  public static var switches: Map<String, Bool>;
  public static var conditionValue:Int;
  public static var currentCondition:Condition;

  public static function initializeGameData() {
    var binary = new BinaryLoader("res/story.json");
    binary.load();
    binary.onLoaded = (bytes:Bytes) -> {
      rawGameData = hxd.res.Any.fromBytes("story.json", bytes).toText();
      parsedGameData = Json.parse(rawGameData);
      isLoaded = true;
      onGameLoad();
    }
    var content : String = "";
    conditionValue = 1;
    updateCondition(0);
    switches = [];
  }

  public static function getGameData() {
    return parsedGameData;
  }

  public static dynamic function onGameLoad() {

  }

  public static function handleChoice(switchName:String) {
    setSwitch(switchName, true);
  }

  public static function setSwitch(name:String, value:Bool) {
    switches.set(name, value);
  }

  public static function getSwitchValue(name:String):Bool {
    if(switches.exists(name)) {
      return switches.get(name);
    } else {
      return false;
    }
  }

  public static function updateCondition(value:Int) {
    conditionValue += value;
    switch(conditionValue) {
      case -1:
        setCondition(Bad);
      case 0:
        setCondition(Average);
      case 1:
        setCondition(Good);
      case _:
        //Do nothing
    }
  }

  public static function getCondition() {
    return currentCondition;
  }

  public static function setCondition(condition) {
    currentCondition = condition;
  }

  public static function clearSwitches() {
    switches.clear();
  }

  public static function clearSwitch(name:String) {
    switches.remove(name);
  }
}