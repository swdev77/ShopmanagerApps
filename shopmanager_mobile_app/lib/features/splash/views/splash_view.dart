import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/core/assets/app_logos.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_in/views/sign_in_page.dart';
import 'package:shopmanager_mobile_app/features/splash/bloc/splash_cubit.dart';
import 'package:shopmanager_mobile_app/features/splash/bloc/splash_state.dart';
import 'package:shopmanager_mobile_app/home_page.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
            print('splash view');
            print(state);
          if (state is Unauthenticated) {
            Navigator.of(context).pushReplacement(
              SignInPage.route(),
            );
          }
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              HomePage.route(),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppLogos.logoDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
