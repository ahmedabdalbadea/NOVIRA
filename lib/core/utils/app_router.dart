import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/features/auth/views/forgot_password_view.dart';
import 'package:novira_app/features/auth/views/log_in_view.dart';
import 'package:novira_app/features/auth/views/sign_up_view.dart';
import 'package:novira_app/features/auth/views/verify_email_view.dart';
import 'package:novira_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSignUpView = '/signUpView';
  static const kLogInView = '/logInView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kVerifyEmailView = '/verifyEmailView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) {
      //     return const AssessmentView();
      //   },
      // ),

      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) {
          final String mood = state.extra as String;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: SignUpView(mood: mood),
          );
        },
      ),

      GoRoute(
        path: kLogInView,
        pageBuilder: (context, state) {
          final String mood = state.extra as String;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: LogInView(mood: mood),
          );
        },
      ),
      GoRoute(
        path: kForgotPasswordView,
        pageBuilder: (context, state) {
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: const ForgotPasswordView(),
          );
        },
      ),
      GoRoute(
        path: kVerifyEmailView,
        pageBuilder: (context, state) {
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: const VerifyEmailView(),
          );
        },
      ),
    ],
  );

  static CustomTransitionPage<dynamic> navigateWithSlidingAnimation({
    required LocalKey? key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
