import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/email.dart';

class EmailInput extends StatelessWidget {
  final EmailValidationError? displayError;
  final Function(String value)? onChanged;

  const EmailInput({super.key, this.displayError, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // final displayError = context.select(
    //   (SignUpCubit cubit) => cubit.state.email.displayError,
    // );

    return TextField(
      key: const Key('emailInput_textField '),      
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'email',
        helperText: '',
        errorText: displayError != null ? 'invalid email' : null,
      ),
    );
  }
}
