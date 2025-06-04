sealed class Result<T> {
  const Result();

  bool get succeed => switch (this) {
        Success() => true,
        Failure() => false,
      };

  bool get failed => !succeed;

  T? get value => switch (this) {
        Success(value: final v) => v,
        Failure() => null,
      };

  void when({
    required void Function(T value) success,
    required void Function(String error) failure,
  }) => switch (this) {
      Success(value: final v) => success(v),
      Failure(error: final e) => failure(e),
    };
}

final class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

final class Failure<T> extends Result<T> {
  final String error;
  const Failure(this.error);
}
