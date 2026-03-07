import 'package:go_router/go_router.dart';
import 'package:novira_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kTestView = '/testView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),

      // GoRoute(
      //   path: '/testView',

      //   builder: (context, state) {
      //     final String mood = state.extra as String;
      //     return TestView(mood: mood);
      //   },
      // ),
    ],
  );
}
