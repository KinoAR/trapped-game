import haxe.io.Bytes;
import hxd.net.BinaryLoader;
import  haxe.Json;
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
  }

  public static function getGameData() {
    return parsedGameData;
  }

  public static dynamic function onGameLoad() {

  }
}