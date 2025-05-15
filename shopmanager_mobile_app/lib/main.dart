import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/app.dart';
import 'package:shopmanager_mobile_app/firebase_options.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  runApp(const App());
}
