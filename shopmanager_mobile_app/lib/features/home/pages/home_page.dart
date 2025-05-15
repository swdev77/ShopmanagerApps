import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/bloc/auth_bloc.dart';
import 'package:shopmanager_mobile_app/features/home/pages/home_view.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(
        child: HomePage(),
      );
  static Route<void> route(context) => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  Widget build(context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return AuthBloc(
            authenticationRepository: sl<AuthenticationRepository>(),
          )..add(
              const AuthUserSubscriptionRequested(),
            );
        },
        child: const HomeView(),
      ),
    );
  }
}
