import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  final void Function()? togglePages;

  const SignInPage({super.key, required this.togglePages});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void signIn() {
    final String email = emailController.text;
    final String password = passwordController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isEmpty) {
      _showSnackBar("Please enter email");
      return;
    }
    if (password.isEmpty) {
      _showSnackBar("Please enter password");
      return;
    }

    authCubit.signIn(email, password);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // logo
              Icon(
                Icons.lock_open,
                size: 64,
                color: colorScheme.primary,
              ),

              const SizedBox(height: 24),

              // title of app

              Text('Shop Manager', style: theme.textTheme.headlineLarge),

              const SizedBox(height: 24),

              //email field

              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),

              // password field

              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(height: 8),

              // forgot password

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text('Forgot password?'),
              //   ],
              // ),

              // sign in button

              const SizedBox(height: 32),
              CustomButton(
                onTap: signIn,
                text: 'Sign In',
              ),

              // oauth buttons google, facebook, apple

              // if account does not exist, sign up ...
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account? '),
                  GestureDetector(
                    onTap: widget.togglePages,
                    child: const Text(
                      'Register now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
