import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/auth/ui/forgot_password_screen.dart';
import 'package:mat_practice_pte/src/features/auth/ui/login_screen.dart';
import 'package:mat_practice_pte/src/features/auth/ui/register_screen.dart';
import 'package:mat_practice_pte/src/features/category/ui/parent_category_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/home_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/me_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/saved_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/scaffold_with_bottom_navigation_bar.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/highlight_incorrect_word/ui/listening_highlight_incorrect_word_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/highlight_summary/ui/highlight_summary_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/multiple_choice_answer/ui/reading_multiple_choice_answer_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/reorder_paragraph/ui/reaading_reorder_paragraph_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/single_choice_answer/ui/reading_single_choice_anwer_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/lesson_scaffold.dart';

import '../../features/category/ui/drawer_screen.dart';
import 'coordinator.dart';

class AppPages {
  static const List<String> noNeedAuthenticatedPages = [
    AppPaths.login,
    AppPaths.register,
    AppPaths.forgotPassword,
  ];
  static final pages = [
    ShellRoute(
        navigatorKey: FCoordinator.shellNavigatorKey,
        builder: (_, state, child) =>
            ScaffoldWithBottomNavigationBar(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: AppPaths.home,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: HomeScreen(
                key: state.pageKey,
              ));
            },
          ),
          GoRoute(
            path: '/saved',
            name: AppPaths.saved,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: SavedScreen(
                key: state.pageKey,
              ));
            },
          ),
          GoRoute(
            path: '/me',
            name: AppPaths.me,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: MeScreen(
                key: state.pageKey,
              ));
            },
          ),
        ]),
    GoRoute(
        path: '/login',
        name: AppPaths.login,
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
              path: 'register',
              name: AppPaths.register,
              builder: (context, state) => const RegisterScreen()),
        ]),
    GoRoute(
        path: '/forgot-password',
        name: AppPaths.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
        routes: const []),
    GoRoute(
        path: '/category',
        name: AppPaths.parentCategory,
        builder: (context, state) {
          final type = state.extra;
          switch (type) {
            case 'listening':
              return const ParentCategoryScreen(initIndexTab: 1);
            case 'reading':
            default:
              return const ParentCategoryScreen();
          }
        },
        routes: [
          GoRoute(
              path: 'drawer/:id',
              name: AppPaths.drawer,
              builder: (context, state) => DrawerScreen(
                    idCategory: state.params['id']!,
                  ),
              routes: [
                typeLessonRoute(
                  path: 'single-choice-answer',
                  name: AppPaths.singleChoiceAnswerScreen,
                  child: const ReadingSingleChoiceAnswerWidget(),
                ),
                typeLessonRoute(
                  path: 'multiple-choice-answer',
                  name: AppPaths.mutipleChoiceAnswerScreen,
                  child: const ReadingMultipleChoiceAnswerWidget(),
                ),
                typeLessonRoute(
                  path: 'reorder-paragraph',
                  name: AppPaths.reOrderParagraph,
                  child: const ReadingReorderParagraphWidget(),
                ),
                typeLessonRoute(
                  path: 'highlight-summary',
                  name: AppPaths.highlightSummary,
                  child: const HighlighSummaryWidget(),
                ),
                typeLessonRoute(
                  path: 'highlight-incorrect-word',
                  name: AppPaths.highlightIncorrectWord,
                  child: const ListeningHighlightIncorrectWordWidget(),
                ),
              ]),
        ]),
  ];

  static GoRoute typeLessonRoute(
      {required String name, required String path, required Widget child}) {
    return GoRoute(
        path: path,
        name: name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return LessonScaffold(
            filterMark: extra['filterMark'],
            isQNumDescending: extra['isQNumDescending'],
            filterPracticed: extra['filterPracticed'],
            idCategory: extra['idCategory'],
            initIdLesson: extra['initIdLesson'],
            initIndex: extra['initIndex'],
            child: child,
          );
        });
  }
}
