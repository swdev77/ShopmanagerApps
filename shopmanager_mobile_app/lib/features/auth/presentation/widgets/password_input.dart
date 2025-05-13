import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.password.displayError,
    );

    return TextField(
      key: const Key('passwordInput_textField'),
      onChanged: (value) => context.read<SignUpCubit>().passwordChanged(value),
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
  const ConfirmPasswordInput({super.key});
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.confirmedPassword.displayError,
    );

    return TextField(
      key: const Key('confirmedPassword_textField'),
      onChanged: (value) =>
          context.read<SignUpCubit>().confirmedPasswordChanged(value),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'confirmed password',
        helperText: '',
        errorText: displayError != null ? 'password do not match' : null,
      ),
    );
  }
}
