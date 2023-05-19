import 'package:appsilon/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  signIn,
}

final appRouter = GoRouter(
  initialLocation: '/sign-in',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/sign-in',
      name: AppRoute.signIn.name,
      builder: (context, state) => const SignInScreen(),
    ),
  ],
);
