import Debug "mo:base/Debug";
import Map "canister:Map";

actor Test {

  public func run() : async Text {
    var log = "";
    var i = 0;
    while (i < 24) {
      let t = debug_show(i);
      log #= "putting: " # debug_show(i, t) # "\n";
      await Map.put(i, t);
      assert (?t == (await Map.get(i)));
      i += 1;
    };
    log
  };

};
