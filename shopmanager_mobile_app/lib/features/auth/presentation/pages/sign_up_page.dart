import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/shop_manager_logo.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:shopmanager_mobile_app/core/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? togglePages;
  const SignUpPage({super.key, required this.togglePages});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void sigUp() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirm = confirmController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isEmpty) {
      _showSnackBar("Please enter email");
      return;
    }
    if (password.isEmpty) {
      _showSnackBar("Please enter password");
      return;
    }
    if (password != confirm) {
      _showSnackBar("Password do not match!");
      return;
    }

    authCubit.signUp(name, email, password);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // logo
                const ShopManagerLogo(
                  height: 160,
                ),

                const SizedBox(height: 8),

                // title of app

                Text(
                  "Let's create an account for you",
                  style: theme.textTheme.labelLarge,
                ),

                const SizedBox(height: 24),

                CustomTextField(
                  hintText: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),

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

                CustomTextField(
                  hintText: 'Confirm',
                  controller: confirmController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                const SizedBox(height: 8),

                // sign up button

                const SizedBox(height: 16),
                CustomButton(
                  onTap: sigUp,
                  text: 'Sign Up',
                ),

                // oauth buttons google, facebook, apple

                // if account does not exist, sign up ...
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: const Text(
                        'Sign in now',
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
