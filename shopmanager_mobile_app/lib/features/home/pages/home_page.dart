import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/home/bloc/user_info_cubit.dart';
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
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserInfoCubit()..fetchUserInfo(),
        child: const HomeView(),
      ),
    );
  }
}
