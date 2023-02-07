import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/features/app/cubit/app_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'app_pages.dart';

class AppRouter {
  const AppRouter();

  GoRouter get router => GoRouter(
        initialLocation: '/',
        navigatorKey: GlobalVariables.navigatorKey,
        routes: AppPages.pages,
        debugLogDiagnostics: true,
        redirect: _redirect,
      );

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    bool isRouteToLogin = false;
    for (String item in AppPages.noNeedAuthenticatedPages) {
      if (state.location.contains(item) == false) {
        isRouteToLogin = true;
        break;
      }
    }

    final isSigned = context.read<AppCubit>().fuser.isLogged;
    if ((isSigned == false) & (isRouteToLogin == true)) {
      return '/login';
    }
    return null;
  }
}
