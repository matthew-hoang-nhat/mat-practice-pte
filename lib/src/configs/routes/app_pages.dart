import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/features/auth/ui/login_screen.dart';

import 'app_paths.dart';

class AppPages {
  static const List<String> needAuthenticatedPages = [];
  static final pages = <GoRoute>[
    GoRoute(
      path: '/',
      name: AppPaths.login,
      builder: (context, state) => const LoginScreen(),
    ),
  ];
}
