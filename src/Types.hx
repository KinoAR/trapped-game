
enum Condition {
  Good;
  Average;
  Bad;
}

typedef Tuple<T, K>= {first:T, second:K};

enum SysCommands {
  ShowText(str:String);
  ShowTextPrsn(name:String, str:String);
  ChangeGraphic(tile:h2d.Tile);
  Wait(seconds:Int);
  SetDays(days:Int);
  SetSwitch(name:String, value:Bool);
  SwitchText(switchName:String, str:String);
  ShowChoice(choices:Array<Tuple<String, String>>);
  None;
  CloseWindow;
  ShowWindow;
}