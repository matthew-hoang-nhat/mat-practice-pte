import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/auth/ui/login_screen.dart';
import 'package:mat_practice_pte/src/features/auth/ui/register_screen.dart';
import 'package:mat_practice_pte/src/features/home/ui/home_screen.dart';

class AppPages {
  static const List<String> noNeedAuthenticatedPages = [
    AppPaths.login,
    AppPaths.register
  ];
  static final pages = <GoRoute>[
    GoRoute(
      path: '/',
      name: AppPaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
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
  ];
}
