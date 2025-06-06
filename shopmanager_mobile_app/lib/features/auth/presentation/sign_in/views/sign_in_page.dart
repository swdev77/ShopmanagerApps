import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_in/views/sign_in_form.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static Page<void> page() => const MaterialPage(child: SignInPage());
  static route(BuildContext context) => MaterialPageRoute<void>(
        builder: (context) => const SignInPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (context) => SignInCubit(
            sl<AuthenticationRepository>(),
          ),
          child: const SignInForm(),
        ),
      ),
    );
  }
}
