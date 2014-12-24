
package promise;

import promise.IThenable;


extern class Promise<T> implements IThenable<T> {

  public static function all<T>(promises: Array<IThenable<Dynamic>>): IThenable<T>;
  // NOTE: postpone
  // public static function race
  @:overload(function <T>(thenable: {then: Dynamic -> IThenable<T>}): Resolve<T> {})
  @:overload(function <T>(thenable: Promise<T>): Resolve<T> {})
  public static function resolve<T>(obj: T): Resolve<T>;

  public static function reject<U>(obj: U): Reject<U>;

  public function new<T, U>(expr: Resolve<T> -> Reject<U> -> IThenable<T>, label: String='');

  @:overload(function <T, U>(onFulfilled: T -> ThenableType<U>, onRejected: T -> U): IThenable<U> {})
  @:overload(function <T, U>(onFulfilled: T -> IThenable<U>, onRejected: T -> U): IThenable<U> {})
  public function then<T, U>(onFulfilled: T -> U, onRejected: T -> U): IThenable<U>;
}
