import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/app_router.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository_impl.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

import 'firebase_options.dart';

Future<void> locator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependenciesGraph();
}

Future<void> setupDependenciesGraph() async {
  await _registerCoreModule();
  _registerApiModule();
  await _registerRepositoriesModule();
}

Future<void> _registerCoreModule() async {
  GlobalVariables.getIt.registerSingleton(FUser());

  GlobalVariables.getIt
    ..registerSingleton(const AppRouter())
    ..registerSingleton(FLocate());

  // ignore: unnecessary_cast
  GlobalVariables.getIt.registerSingleton(AndroidFApp() as FApp);
}

Future<void> registerAppSharedAsync() async {}
void _registerApiModule() {}
Future<void> _registerRepositoriesModule() async {
  GlobalVariables.getIt.registerSingleton(AuthenticateRepositoryImpl());
}
