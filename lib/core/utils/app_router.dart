import 'package:go_router/go_router.dart';
import 'package:novira_app/features/auth/views/log_in_view.dart';
import 'package:novira_app/features/auth/views/sign_up_view.dart';
import 'package:novira_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSignUpView = '/signUpView';
  static const kLogInView = '/logInView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kSignUpView,

        builder: (context, state) {
          final String mood = state.extra as String;
          return SignUpView(mood: mood);
        },
      ),

      GoRoute(
        path: kLogInView,

        builder: (context, state) {
          final String mood = state.extra as String;
          return LogInView(mood: mood);
        },
      ),
    ],
  );
}
