import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/http/dio_http_client.dart';
import 'package:mat_practice_pte/src/networks/http/services/definition_service.dart';
import 'package:mat_practice_pte/src/services/audio_manger.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'firebase_options.dart';
import 'src/configs/routes/app_router.dart';

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
  GlobalVariables.getIt
    ..registerSingleton(FUser())
    // ignore: unnecessary_cast
    ..registerSingleton(AndroidFApp() as FApp)
    ..registerSingleton(const AppRouter())
    ..registerSingleton(FLocate())
    ..registerSingleton(FAudioManager())
    ..registerSingleton(DioHttpClient('https://api.dictionaryapi.dev'));
}

Future<void> registerAppSharedAsync() async {}
void _registerApiModule() {
  GlobalVariables.getIt.registerSingleton(
      DefinitionService(GlobalVariables.getIt<DioHttpClient>()));
}

Future<void> _registerRepositoriesModule() async {}
