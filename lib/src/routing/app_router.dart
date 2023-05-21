import 'package:appsilon/src/features/authentication/presentation/screens/settings_screen.dart';
import 'package:appsilon/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:appsilon/src/features/order/presentation/screens/home_screen.dart';
import 'package:appsilon/src/features/report/presentation/screens/report_screen.dart';
import 'package:appsilon/src/features/subscription/presentation/screens/subscription_screen.dart';
import 'package:appsilon/src/shared/screens/navigation_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, path: '/sign-in', page: SignInRoute.page),
        AutoRoute(
          page: NavigationRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'report', page: ReportRoute.page),
            AutoRoute(path: 'subscription', page: SubscriptionRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
      ];
}
