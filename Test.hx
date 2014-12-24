package;

// import promisex.Promise;
import promise.Promise;


class Test {

  public static function testPro<T>(?arg: T): Promise<T, String> {
    return new Promise(function(onFulfilled, onRejected) {
      if (arg == null) {
        onRejected('nullじゃん！');
      }
      onFulfilled(arg);
    });
  }

  public static function asyncLook(): Promise<String, String> {
    return new Promise(function(ff, rj) {
      trace('prepre');
      haxe.Timer.delay(function() ff('heeei!'), 1000);
      trace('end');
    });
  }

  public static function main() {
    testPro('test!')
      .then(function(v) {trace(v); return 'second';}, function(err) return err)
      .then(function(v) trace(v), null);

    testPro()
      .then(function(v) trace(v), function(err) trace(err));

    asyncLook()
      .then(function(v) trace(v), null);
  }
}
