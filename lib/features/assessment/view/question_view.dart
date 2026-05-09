import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/core/utils/api_service.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/assessment/data/repos/assessement_repo_impl.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/question_view_body.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.moodMap});
  final Map<String, dynamic> moodMap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuestionCubit(AssessementRepoImpl(ApiService(Dio())))
            ..fetchQuestions(),
      child: GradientScaffold(
        body: SafeArea(child: QuestionViewBody(moodMap: moodMap)),
      ),
    );
  }
}
