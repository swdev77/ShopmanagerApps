import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationStatus { invalid }

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationStatus> {
  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');
  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  ConfirmedPasswordValidationStatus? validator(String? value) {
    return password == value
        ? null
        : ConfirmedPasswordValidationStatus.invalid;
  }
  
}
