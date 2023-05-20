import 'package:appsilon/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:appsilon/src/shared/screens/home_screen.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, path: '/sign-in', page: SignInRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
      ];
}
