
enum Condition {
  Good;
  Average;
  Bad;
}

enum SysCommands {
  ShowText(str:String);
  ChangeGraphic(tile:h2d.Tile);
  Wait(seconds:Int);
  SetDays(days:Int);
  None;
  CloseWindow;
  ShowWindow;
}