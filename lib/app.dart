import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mat_practice_pte/src/configs/constants/app_themes.dart';
import 'package:mat_practice_pte/src/configs/routes/app_router.dart';
import 'package:mat_practice_pte/src/features/app/cubit/app_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppThemes appTheme = LightTheme();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => AppCubit()..initCubit(),
          )
        ],
        child: MaterialApp.router(
          theme: appTheme.themeData(),
          builder: FlutterSmartDialog.init(),
          routerConfig: GlobalVariables.getIt<AppRouter>().router,
        ));
  }
}
