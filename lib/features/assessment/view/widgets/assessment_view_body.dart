import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/assessment_intro_card.dart';

class AssessmentViewBody extends StatelessWidget {
  const AssessmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 40),
            child: Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 650),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 28 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: AssessmentIntroCard(
                  onStartPressed: () {
                    BlocProvider.of<QuestionCubit>(context).fetchQuestions();
                    context.go(AppRouter.kQuestionView);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
