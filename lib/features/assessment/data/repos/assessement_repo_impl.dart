import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:novira_app/core/errors/failure.dart';
import 'package:novira_app/core/errors/server_failure.dart';
import 'package:novira_app/core/utils/api_service.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';
import 'package:novira_app/features/assessment/data/repos/assessement_repo.dart';
import 'package:novira_app/generated/l10n.dart';

class AssessementRepoImpl implements AssessementRepo {
  final ApiService _apiService;

  AssessementRepoImpl(this._apiService);

  @override
  Future<Either<Failure, QuestionModel>> fetchQuestion(String lang) async {
    try {
      var data = await _apiService.get(endPoint: "users/assessment?lang=$lang");

      QuestionModel questions = QuestionModel.fromJson(data);
      return right(questions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(S.current.unknown_error));
      }
    }
  }
}
