import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/splash/bloc/splash_cubit.dart';
import 'package:shopmanager_mobile_app/features/splash/views/splash_view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashCubit()..appStarted(),
        child: const SplashView(),
      ),
    );
  }
}
