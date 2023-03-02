import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/word_definition/cubit/show_bottom_definition_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

class FCoordinator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
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

  static final fShows = GlobalVariables.getIt<FApp>();

  static Future<void> showDefinition(String text) => context
      .read<ShowBottomDefinitionCubit>()
      .showDefinition(context, text: text);

  static void showBottomModalSheet(
      {required Widget title, required Widget widget}) {
    fShows.showBottomModalSheet(
        sizeHeight: 0.4, context, title: title, widget: widget);
  }

  static void pushDetailLesson(
      {required String initIdLesson,
      required int initIndex,
      required String idCategory,
      required FilterMarkEnum? filterMark,
      required bool? isQNumDescending,
      required FilterPracticedEnum? filterPracticed}) {
    final nameRoute = GlobalVariables.nameRouteLessonType[idCategory];
    if (nameRoute != null) {
      goNamed(
        nameRoute,
        params: {'id': idCategory},
        extra: {
          'isQNumDescending': isQNumDescending,
          'filterMark': filterMark,
          'filterPracticed': filterPracticed,
          'idCategory': idCategory,
          'initIdLesson': initIdLesson,
          'initIndex': initIndex,
        },
      );
    }
  }
}
