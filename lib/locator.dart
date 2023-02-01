import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/configs/routes/app_router.dart';

Future<void> locator() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions? firebaseOptions;
  if (kIsWeb) {
    firebaseOptions = const FirebaseOptions(
        apiKey: 'AIzaSyBmE5ecsJAdikT_-mk1idpeqoF9R_laGzw',
        appId: "1:611444805102:web:0ddc5bedb11fc62f2ad2ff",
        messagingSenderId: '611444805102',
        projectId: '"mat-practice-pte"');
  }
  await Firebase.initializeApp(options: firebaseOptions);
}

Future<void> setupDependenciesGraph() async {
  await _registerCoreModule();
  _registerApiModule();
  await _registerRepositoriesModule();
  GetIt.I.registerSingleton(const AppRouter());
}

Future<void> _registerCoreModule() async {}
Future<void> registerAppSharedAsync() async {}
void _registerApiModule() {}
Future<void> _registerRepositoriesModule() async {}
