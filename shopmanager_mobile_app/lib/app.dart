import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/theme/app_theme.dart';
import 'package:shopmanager_mobile_app/features/splash/views/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      //   useMaterial3: true,
      // ),

      home: const SplashPage(),

      // home: FlowBuilder<AuthStatus>(
      //   state: context.select((AuthBloc bloc) => bloc.state.status),
      //   onGeneratePages: onGenerateAppViewPages,
      // ),
    );
  }
}
