import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/widgets/custom_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 24),
            CustomField(hintText: 'Username', controller: null),
            const SizedBox(height: 8),
            CustomField(hintText: 'Email', controller: null),
            const SizedBox(height: 8),
            CustomField(
              hintText: 'Password',
              controller: null,
              isObscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
