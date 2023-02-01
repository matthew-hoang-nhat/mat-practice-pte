import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_pages.dart';
import 'app_paths.dart';

class AppRouter {
  const AppRouter();

  GoRouter get router => GoRouter(
        initialLocation: '/',
        routes: AppPages.pages,
        debugLogDiagnostics: true,

        // redirect: (context, state) => _redirect(context, state),
      );

  _redirect(BuildContext context, GoRouterState state) {
    final isNeedAuthenticatePage = AppPages.needAuthenticatedPages.contains(
      state.location,
    );
    const isSigned = true;
    if ((isSigned == false) & (isNeedAuthenticatePage == true)) {
      return AppPaths.login;
    }
    return null;
  }
}
