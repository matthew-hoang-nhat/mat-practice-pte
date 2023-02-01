import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_locate.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

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
  await setupDependenciesGraph();
}

Future<void> setupDependenciesGraph() async {
  await _registerCoreModule();
  _registerApiModule();
  await _registerRepositoriesModule();
  GlobalVariables.getIt.registerSingleton(const AppRouter());
  GlobalVariables.getIt.registerSingleton(MaLocate());
}

Future<void> _registerCoreModule() async {}
Future<void> registerAppSharedAsync() async {}
void _registerApiModule() {}
Future<void> _registerRepositoriesModule() async {}
