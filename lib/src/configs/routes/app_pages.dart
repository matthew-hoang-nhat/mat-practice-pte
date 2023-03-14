import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/auth/ui/forgot_password_screen.dart';
import 'package:mat_practice_pte/src/features/auth/ui/login_screen.dart';
import 'package:mat_practice_pte/src/features/auth/ui/register_screen.dart';
import 'package:mat_practice_pte/src/features/category/ui/drawer_screen.dart';
import 'package:mat_practice_pte/src/features/category/ui/parent_category_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/home_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/me_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/saved_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/scaffold_with_bottom_navigation_bar.dart';

class AppPages {
  static const List<String> noNeedAuthenticatedPages = [
    AppPaths.login,
    AppPaths.register,
    AppPaths.forgotPassword,
  ];
  static final pages = [
    ShellRoute(
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
              routes: [
                GoRoute(
                    path: 'category',
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
                      ),
                    ]),
              ]),
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
  ];
}
