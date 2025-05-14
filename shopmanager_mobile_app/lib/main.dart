import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/app.dart';
import 'package:shopmanager_mobile_app/app_bloc_observer.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/firebase_options.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  await initializeDependencies();

  runApp(App(authenticationRepository: authenticationRepository));
}
