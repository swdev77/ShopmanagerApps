import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/core/theme/app_theme.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_state.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/pages/auth_page.dart';
import 'package:shopmanager_mobile_app/features/home/pages/home_page.dart';

import 'injection_container.dart';

class App extends StatelessWidget {
  App({super.key});

  final firebaseAuthRepo = sl<FirebaseAuthRepository>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit(authRepository: firebaseAuthRepo)..checkAuth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightThemeData,
        darkTheme: AppTheme.darkThemeData,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            debugPrint("Auth state: $state");

            if (state is Unauthenticated) {
              return const AuthPage();
            }
            if (state is Authenticated) {
              return const HomePage();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
