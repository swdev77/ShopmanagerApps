import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) =>
      _passwordRegExp.hasMatch(value ?? '')
          ? null
          : PasswordValidationError.invalid;
}
