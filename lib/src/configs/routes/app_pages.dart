import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';

class AppPages {
  static const List<String> needAuthenticatedPages = [];
  static final pages = <GoRoute>[
    GoRoute(
      path: '/login',
      name: AppPaths.login,
    ),
    GoRoute(
      path: '/register',
      name: AppPaths.register,
    ),
  ];
}
