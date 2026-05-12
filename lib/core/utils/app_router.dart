import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/features/assessment/view/assessment_view.dart';
import 'package:novira_app/features/assessment/view/question_view.dart';
import 'package:novira_app/features/assessment/view/result_view.dart';
import 'package:novira_app/features/auth/views/forgot_password_view.dart';
import 'package:novira_app/features/auth/views/log_in_view.dart';
import 'package:novira_app/features/auth/views/sign_up_view.dart';
import 'package:novira_app/features/auth/views/verify_email_view.dart';
import 'package:novira_app/features/home/view/home_view.dart';
import 'package:novira_app/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kSignUpView = '/signUpView';
  static const kLogInView = '/logInView';
  static const kForgotPasswordView = '/forgotPasswordView';
  static const kVerifyEmailView = '/verifyEmailView';
  static const kAssessmentView = '/assessmentView';
  static const kQuestionView = '/questionView';
  static const kResultView = '/resultView';
  static const kHomeView = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kAssessmentView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: AssessmentView(moodMap: moodMap),
          );
        },
      ),
      GoRoute(
        path: kQuestionView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: QuestionView(moodMap: moodMap),
          );
        },
      ),

      GoRoute(
        path: kResultView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> extra = state.extra as Map<String, dynamic>;
          final int totalScore = extra['totalScore'] as int;
          final int maxScore = extra['maxScore'] as int;
          final int totalQuestions = extra['totalQuestions'] as int;
          final String assessmentType = extra['assessmentType'] as String;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: ResultView(
              totalScore: totalScore,
              maxScore: maxScore,
              totalQuestions: totalQuestions,
              assessmentType: assessmentType,
            ),
          );
        },
      ),

      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: SignUpView(moodMap: moodMap),
          );
        },
      ),

      GoRoute(
        path: kLogInView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: LogInView(moodMap: moodMap),
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
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: VerifyEmailView(moodMap: moodMap),
          );
        },
      ),

      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          final Map<String, dynamic> moodMap =
              state.extra as Map<String, dynamic>;
          // int totalScore = state.extra as int;
          return navigateWithSlidingAnimation(
            key: state.pageKey,
            child: HomeView(moodMap: moodMap),
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
