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
import 'package:mat_practice_pte/src/features/lesson/type/listening/fill_in_blanks_text_fields/ui/listening_fill_in_blanks_text_fields_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/highlight_incorrect_word/ui/listening_highlight_incorrect_word_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/highlight_summary/ui/highlight_summary_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/multiple_choice_answer/ui/listening_multiple_choice_anwer.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/select_missing_word/ui/select_missing_word_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/listening/single_choice_answer/ui/single_choice_answer.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/fill_in_blanks/ui/reading_fill_in_blanks_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/fill_in_blanks_drag_and_drog/ui/reading_fill_in_blanks_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/multiple_choice_answer/ui/reading_multiple_choice_answer_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/reorder_paragraph/ui/reaading_reorder_paragraph_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/type/reading/single_choice_answer/ui/reading_single_choice_anwer_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/ui/add_comment_screen.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/lesson_scaffold.dart';
import 'package:mat_practice_pte/src/features/search/ui/search_screen.dart';

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
            parentNavigatorKey: FCoordinator.shellNavigatorKey,
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
            parentNavigatorKey: FCoordinator.shellNavigatorKey,
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
            parentNavigatorKey: FCoordinator.shellNavigatorKey,
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
        parentNavigatorKey: FCoordinator.navigatorKey,
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
              path: 'register',
              name: AppPaths.register,
              parentNavigatorKey: FCoordinator.navigatorKey,
              builder: (context, state) => const RegisterScreen()),
        ]),
    GoRoute(
        path: '/forgot-password',
        parentNavigatorKey: FCoordinator.navigatorKey,
        name: AppPaths.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
        routes: const []),
    GoRoute(
        path: '/search',
        parentNavigatorKey: FCoordinator.navigatorKey,
        name: AppPaths.search,
        builder: (context, state) => SearchScreen(key: UniqueKey()),
        routes: const []),
    GoRoute(
        path: '/comment',
        name: AppPaths.addComment,
        parentNavigatorKey: FCoordinator.navigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return AddCommentScreen(
            idCategory: extra['idCategory']! as String,
            idLesson: extra['idLesson']! as String,
            onSuccess: extra['onSuccess'] as Function(),
          );
        }),
    GoRoute(
        path: '/category',
        name: AppPaths.parentCategory,
        parentNavigatorKey: FCoordinator.navigatorKey,
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
              parentNavigatorKey: FCoordinator.navigatorKey,
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
                typeLessonRoute(
                  path: 'fill-in-blanks',
                  name: AppPaths.fillInBlanks,
                  child: const ReadingFillInBanksWidget(),
                ),
                typeLessonRoute(
                  path: 'fill-in-blanks-drag-and-drogs',
                  name: AppPaths.fillInBlanksDragAndDrog,
                  child: const ReadingFillInBanksDragAndDrogWidget(),
                ),
                typeLessonRoute(
                  path: 'fill-in-blanks-drag-and-drogs-text-fields',
                  name: AppPaths.fillInBlanksTextFields,
                  child: const ListeningFillInBanksDragAndDrogWidget(),
                ),
                typeLessonRoute(
                  path: 'select-missing-word',
                  name: AppPaths.selectMissingWord,
                  child: const SelectMissingWordWidget(),
                ),
                typeLessonRoute(
                  path: 'listening-multiple-choice-answer',
                  name: AppPaths.listeningMultipleChoiceAnswer,
                  child: const ListeningMultipleChoiceAnswerWidget(),
                ),
                typeLessonRoute(
                  path: 'listening-single-choice-answer',
                  name: AppPaths.listeningSingleChoiceAnswer,
                  child: const ListeningSingleChoiceAnswerWidget(),
                )
              ]),
        ]),
  ];

  static GoRoute typeLessonRoute(
      {required String name, required String path, required Widget child}) {
    return GoRoute(
        path: path,
        name: name,
        parentNavigatorKey: FCoordinator.navigatorKey,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          // final extra = <String, dynamic>{
          //   // 'filterMark': extra['filterMark'],
          //   // 'isQNumDescending': extra['isQNumDescending'],
          //   // 'filterPracticed': extra['filterPracticed'],
          //   'idCategory': 'R1',
          //   'initIdLesson': '235',
          //   'initIndex': 0
          // };

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
