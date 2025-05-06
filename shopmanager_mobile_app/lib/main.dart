import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/theme/app_theme.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      //   useMaterial3: true,
      // ),

      home: SignUpPage(),
    );
  }
}
