import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/password.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/password_comfirmed.dart';

class PasswordInput extends StatelessWidget {
  final PasswordValidationError? displayError;
  final Function(String value)? onChanged;

  const PasswordInput({super.key, this.displayError, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('passwordInput_textField'),
      onChanged:
          onChanged, //(value) => context.read<SignUpCubit>().passwordChanged(value),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        helperText: '',
        errorText: displayError != null ? 'invalid password' : null,
      ),
    );
  }
}

class ConfirmPasswordInput extends StatelessWidget {
  final ConfirmedPasswordValidationStatus? displayError;
  final Function(String value)? onChanged;

  const ConfirmPasswordInput({super.key, this.displayError, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('confirmedPassword_textField'),
      onChanged: onChanged, //(value) =>
      //context.read<SignUpCubit>().confirmedPasswordChanged(value),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'confirmed password',
        helperText: '',
        errorText: displayError != null ? 'password do not match' : null,
      ),
    );
  }
}
