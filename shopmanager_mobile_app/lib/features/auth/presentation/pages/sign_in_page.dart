import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/widgets/email_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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

                //email field

                // password field

                // forgot password

                // sign in button

                // oauth buttons google, facebook, apple

                // if account does not exist, sign up ...
              ],
            ),
          ),
        ));
  }
}
