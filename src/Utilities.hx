import GameData.Command;
import Types.SysCommands;
import Types.Condition;
import Types.Tuple;
using Lambda;

class Utilities {
  public static function createCommand(command:Command) : SysCommands {
    var commandName = command.name;
    var args = command.args;
    return switch(commandName.toUpperCase()) {
      case "SHOWTEXT":
        ShowText(args.join(" "));
      case "SHOWTEXTP":
        var person = args.shift();
        ShowTextPrsn(person, args.join(" ") );
      case "SETDAYS":
        trace(args[0]);
        SetDays(args[0]);
      case "CHANGEGRAPHIC":
        var imageBytes = hxd.Res.loader.fs.get(args[0]).getBytes();
        ChangeGraphic(hxd.res.Any.fromBytes(args[0], imageBytes).toTile());
      case "WAIT":
        Wait( Std.parseInt(args[0]));
      case "CLOSEWINDOW":
        CloseWindow;
      case "SHOWWINDOW":
        ShowWindow;
      case "SETSWITCH":
        SetSwitch(args[0], args[1]);
      case "SWITCHTEXT":
        var switchName = args.shift();
        SwitchText(switchName, args.join(" "));
      case "SWITCHCOND":
        trace("Sent switch cond");
        SwitchCond(args[0], args[1]);
      case "CONDTEXT":
        var cond = switch(args.shift().toUpperCase()) {
          case "GOOD":
            Good;
          case "AVG":
            Average;
          case "BAD":
            Bad;
          case _:
            Good;
        };
        ConditionText(cond, args.join(" "));
      case "SHOWCHOICE":
        var choices = args.map(element -> {
          return {first:element[0], second:element[1]}
        });
        ShowChoice(choices);
      case _:
        None;
        //Do nothing
    }
  }

  public static function clamp(num:Float, min:Float, max:Float):Float {
    return Math.min(Math.max(num, min), max);
  }

  public static function lerp(start:Float, end:Float, lerpAmt:Float) {
    return (1 - lerpAmt) * start + lerpAmt * end;
  }

}