package;
import h2d.Text;
import WindowBase;
import Types.SysCommands;
import Types.Tuple;
import hxd.res.DefaultFont;
using Lambda;

class ChoiceWindow extends WindowBase {
  var textYPosition:Float = 0;
  var choices:Array<h2d.Object>;
  public function new(parent: h2d.Object, x:Float, y:Float, width:Float, height:Float) {
    super(parent, x, y, width, height);
  }

  override function init() {
    super.init();
    drawBorder(this.x, this.y, this.width, this.height);
    this.choices = [];
  }

  public function showChoices(choices: Array<Tuple<String, String>>) {
    this.show(true);
    addChoices(choices);
  }

  public function addChoices(choices:Array<Tuple<String, String>>) {
    choices.iter(choice -> {
      addChoice(choice.first, choice.second);
    });
  }

  function addChoice(choiceText:String, switchName:String) {
    var choice = new Text(DefaultFont.get(), this);
    var interaction = new h2d.Interactive(this.width, choice.lineSpacing, choice);
    choice.text = choiceText;
    choice.y = textYPosition;
    textYPosition+= choice.lineSpacing;
    choices.push(choice);
    interaction.onClick = (e: hxd.Event) -> {
      GameData.setSwitch(switchName, true);
      finishChoices();
      EventListener.emitSignal("choiceComplete");
    };
  }

  private function clearChoices() {
    this.removeChildren();
    this.choices.resize(0);
  }

  private function finishChoices() {
    clearChoices();
    show(false);
  }

  
}