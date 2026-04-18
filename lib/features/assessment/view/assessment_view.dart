import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/core/utils/api_service.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/assessment/data/repos/assessement_repo_impl.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/assessment_view_body.dart';

class AssessmentView extends StatelessWidget {
  const AssessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              QuestionCubit(AssessementRepoImpl(ApiService(Dio()))),
          child: AssessmentViewBody(),
        ),
      ),
    );
  }
}
