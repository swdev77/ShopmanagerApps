part of 'sign_in_cubit.dart';

final class SignInState extends Equatable {
  const SignInState() : this._();

  const SignInState._({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  SignInState withEmail(String value) => SignInState._(
        email: Email.dirty(value),
        password: password,
      );

  SignInState withPassword(String value) => SignInState._(
        email: email,
        password: Password.dirty(value),
      );

  SignInState withSubmissionInProgress() => SignInState._(
        email: email,
        password: password,
        status: FormzSubmissionStatus.inProgress,
      );

  SignInState withSubmissionInSuccess() => SignInState._(
        email: email,
        password: password,
        status: FormzSubmissionStatus.success,
      );

  SignInState withSubmissionFailure([String? error]) => SignInState._(
        email: email,
        password: password,
        status: FormzSubmissionStatus.failure,
        errorMessage: error,
      );

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  bool get isValid => Formz.validate([email, password]);

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorMessage,
      ];
}
