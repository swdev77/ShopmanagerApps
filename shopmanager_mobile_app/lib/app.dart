import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/theme/app_theme.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:shopmanager_mobile_app/features/splash/views/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        home: const SignInPage());
  }
}
