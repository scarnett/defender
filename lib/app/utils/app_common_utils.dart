class Nullable<T> {
  final T _value;

  Nullable(
    this._value,
  );

  T get value => _value;
}
