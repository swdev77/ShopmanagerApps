import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/bloc/auth_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/models/user.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    UserModel user = context.read<AuthBloc>().state.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogoutPressed());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              user.email ?? '',
              style: textTheme.titleLarge,
            ),
            Text(
              user.name ?? '',
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
