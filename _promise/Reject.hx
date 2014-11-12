
package promise;

import promise.IThenable;

extern class Reject<T> implements IThenable<T> {
  public function then<T, U>(onFulfilled: T -> U, onRejected: T -> U): IThenable<U>;
}
