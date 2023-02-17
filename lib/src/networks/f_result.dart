class FResult<T> {
  T? data;
  String? error;
  bool get isError => error != null;
  bool get isSuccess => error == null && data != null;
  FResult.success(this.data) {
    error = null;
  }

  FResult.error(String? error) {
    data = null;
    this.error = error ?? 'An Unknown Error Occurred';
  }

  FResult.exception(Object? e) {
    data = null;

    error ??= 'An Unknown Error Occurred';
  }
}
