import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_state.dart';
import 'package:shopmanager_mobile_app/features/settings/presentation/pages/settings_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Authenticated) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      state.user.email,
                      style: textTheme.titleLarge,
                    ),
                    // Text(
                    //   state.user.uid,
                    //   style: textTheme.headlineSmall,
                    // ),
                    const SizedBox(height: 32),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // navigate to page settings
                        Navigator.push(context, SettingsPage.route());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          Text('Settings'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
