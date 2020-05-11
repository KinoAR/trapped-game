
enum Condition {
  Good;
  Average;
  Bad;
}

enum SysCommands {
  ShowText(str:String);
  ChangeGraphic(tile:h2d.Tile);
  CloseWindow;
  ShowWindow;
}