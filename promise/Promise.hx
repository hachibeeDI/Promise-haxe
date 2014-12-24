
package promise;

import promise.IThenable;


@:native("Promise")
extern class Promise<T, E> implements IThenable<T> {

  public static function all<T>(promises: Array<IThenable<Dynamic>>): IThenable<T>;
  // NOTE: postpone
  // public static function race
  @:overload(function <T>(thenable: {then: Dynamic -> IThenable<T>}): Resolve<T> {})
  @:overload(function <T, E>(thenable: Promise<T, E>): Promise<T, E> {})
  public static function resolve<T>(obj: T): Resolve<T>;

  public static function reject<E>(obj: E): Reject<E>;

  // public function new<T, E>(expr: Resolve<T> -> Reject<E> -> IThenable<T>, label: String='');
  public function new<T, E>(expr: (T -> Void) -> (E -> Void) -> Void, label: String='');

  @:overload(function <T, E>(onFulfilled: T -> ThenableType<E>, onRejected: T -> E): IThenable<E> {})
  @:overload(function <T, E>(onFulfilled: T -> IThenable<E>, onRejected: T -> E): IThenable<E> {})
  public function then<T, E>(onFulfilled: T -> E, onRejected: T -> E): IThenable<E>;
}
