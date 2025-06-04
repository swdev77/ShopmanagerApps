import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/shop_manager_logo.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:shopmanager_mobile_app/core/widgets/custom_text_field.dart';

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

  Future<void> signIn() async {
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

    try {
      await authCubit.signIn(email, password);
    } catch (e) {
      debugPrint(e.toString());
      _showSnackBar('Error on sign in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // logo
                const ShopManagerLogo(
                  width: 160,
                ),
                // const SizedBox(height: 16),

                // title of app
                Text(
                  'Welcome!',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 16),

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

                const SizedBox(height: 16),
                CustomButton(
                  onTap: signIn,
                  text: 'Sign In',
                ),

                // oauth buttons google, facebook, apple

                // if account does not exist, sign up ...
                const SizedBox(height: 16),
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
      ),
    );
  }
}
