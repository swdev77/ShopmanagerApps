abstract class Failure {
  final String message;
  final String code;

  const Failure({required this.message, required this.code});
}

class AppFailure extends Failure {
  AppFailure({required super.message, required super.code});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.code});
}
