import 'package:auto_route/auto_route.dart';
import 'package:movieapp/src/features/splash/splash_page.dart';

//flutter packages pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
  ],
)
class $AppRouter {}
