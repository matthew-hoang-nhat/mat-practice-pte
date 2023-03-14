import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';

class FCoordinator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;
  static String get location => GoRouter.of(context).location;

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void onBack([Object? result]) {
    if (canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  static void pushNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.pushNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void goNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void pushReplacementNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.pushReplacementNamed(
        name,
        params: params,
        queryParams: queryParams,
        extra: extra,
      );

  static void showLoginScreen() {
    goNamed(AppPaths.login);
  }

  static void showForgotScreen() {
    pushNamed(AppPaths.forgotPassword);
  }

  static void showHomeScreen() {
    goNamed(AppPaths.home);
  }

  static void showRegisterScreen() {
    pushNamed(AppPaths.register);
  }

  static void showDrawerScreen({required String idCategory}) {
    pushNamed(AppPaths.drawer, params: {'id': idCategory});
  }

  static void showParentCategoryScreen({required String parentCategoryType}) {
    goNamed(AppPaths.parentCategory, extra: parentCategoryType);
  }

  static void showSavedScreen() {
    goNamed(AppPaths.saved);
  }

  static void showMeScreen() {
    goNamed(AppPaths.me);
  }
}
