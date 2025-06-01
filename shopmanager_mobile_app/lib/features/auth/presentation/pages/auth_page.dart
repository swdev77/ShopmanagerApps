import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSigInPage = true;

  void togglePages() {
    setState(() {
      showSigInPage = !showSigInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSigInPage) {
      return SignInPage(
        togglePages: togglePages,
      );
    } else {
      return SignUpPage(
        togglePages: togglePages,
      );
    }
  }
}
