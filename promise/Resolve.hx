
package promise;

import promise.IThenable;

extern class Resolve<T> implements IThenable<T> {
  public function then<T, U>(onFulfilled: T -> U, onRejected: T -> U): IThenable<U>;

  @:overload(function <T>(obj: IThenable<T>): IThenable<T> {})
  @:overload(function <T>(obj: ThenableType<T>): IThenable<T> {})
  public function new<T>(obj: T);
}

