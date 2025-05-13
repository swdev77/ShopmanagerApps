import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_up/views/sign_up_page.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: [
            _SignInButton(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignInCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) {
      return const CircularProgressIndicator();
    }

    final isValid = context.select(
      (SignInCubit cubit) => cubit.state.isValid,
    );

    return ElevatedButton(
        key: const Key('signIn_button'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size.fromHeight(48),
        ),
        onPressed: isValid
            ? () => context.read<SignInCubit>().signInWithCredentials()
            : null,
        child: const Text('Sign In'));
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('createAccount_button'),
      onPressed: () => Navigator.of(context).push(SignUpPage.route()),
      child: const Text('Create Account'),
    );
  }
}
