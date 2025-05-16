import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:shopmanager_mobile_app/features/home/bloc/user_info_cubit.dart';
import 'package:shopmanager_mobile_app/features/home/bloc/user_info_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserInfoLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<UserInfoCubit>().userLogout();
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  Text(
                    state.userModel.email ?? '',
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    state.userModel.name ?? '',
                    style: textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
