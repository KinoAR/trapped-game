import GameData.Command;
import Types.SysCommands;

class Utilities {
  public static function createCommand(command:Command) : SysCommands {
    var commandName = command.name;
    var args = command.args;
    return switch(commandName.toUpperCase()) {
      case "SHOWTEXT":
        ShowText(args.join(" "));
      case "WAIT":
        Wait( Std.parseInt(args[0]));
      case "CLOSEWINDOW":
        CloseWindow;
      case "SHOWWINDOW":
        ShowWindow;
      case _:
        None;
        //Do nothing
    }
  }

  public static function clamp(num:Float, min:Float, max:Float):Float {
    return Math.min(Math.max(num, min), max);
  }
}