import Types;

class Player {
  var condition:Condition;

  public function new() {
    condition = Good;
  }

  public function setCondition(condition:Condition) {
    this.condition = condition;
  }
}