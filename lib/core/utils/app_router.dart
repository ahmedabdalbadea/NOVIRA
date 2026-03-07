import 'package:go_router/go_router.dart';
import 'package:novira_app/features/auth/views/sign_up_view.dart';
import 'package:novira_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSignUpView = '/signUpView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: '/signUpView',

        builder: (context, state) {
          final String mood = state.extra as String;
          return SignUpView(mood: mood);
        },
      ),
    ],
  );
}
