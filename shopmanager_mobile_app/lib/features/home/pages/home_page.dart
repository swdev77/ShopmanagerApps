import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/home/pages/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(
        child: HomePage(),
      );
  static Route<void> route(context) => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
    );
  }
}
