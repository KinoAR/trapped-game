using Lambda;

class EventListener {
  static var events: Map<String,Array<() -> Void>> = [];

  public static function addEvent(eventName:String, fn:() -> Void) {
    if(events.exists(eventName)) {
      var event = events.get(eventName);
      event.push(fn);
    } else {
      events.set(eventName, [fn]);
    }
  }

  public static function emitSignal(eventName) {
    if(events.exists(eventName)) {
      var event = events.get(eventName);
      event.iter((fn) -> fn());
    }
  }

  public static function clearHooks(eventName) {
    if(events.exists(eventName)) {
      var event = events.get(eventName);
      event.resize(0);
    }
  }
  
  public static function clear() {
    events.clear();
  }
}