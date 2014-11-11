package promise;


typedef ThenableType<U> = {
  function then<U>(onFulfilled: Dynamic, onRejected: Dynamic): IThenable<U>;
}


interface IThenable<T> {
  @:overload(function <T, U>(onFulfilled: T -> ThenableType<U>, onRejected: T -> U): IThenable<U> {})
  @:overload(function <T, U>(onFulfilled: T -> IThenable<U>, onRejected: T -> U): IThenable<U> {})
  public function then<T, U>(onFulfilled: T -> U, onRejected: T -> U): IThenable<U>;

  // public function catch<T>(onFulfilled: T -> U, onRejected: T -> U): IThenable<U>;
}
