import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:novira_app/core/errors/failure.dart';
import 'package:novira_app/core/errors/server_failure.dart';
import 'package:novira_app/core/utils/api_service.dart';
import 'package:novira_app/features/assessment/data/models/question_model/metadata.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';
import 'package:novira_app/features/assessment/data/models/question_model/standard_answer.dart';
import 'package:novira_app/features/assessment/data/repos/assessement_repo.dart';
import 'package:novira_app/generated/l10n.dart';

class AssessementRepoImpl implements AssessementRepo {
  final ApiService _apiService;

  AssessementRepoImpl(this._apiService);

  @override
  Future<Either<Failure, QuestionModel>> fetchQuestion(String lang) async {
    try {
      var data = await _apiService.get(endPoint: "users/assessment?lang=$lang");

      QuestionModel questions = _parseQuestionModel(data, lang);
      return right(questions);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(S.current.unknown_error));
      }
    }
  }

  QuestionModel _parseQuestionModel(dynamic data, String lang) {
    if (data is Map<String, dynamic> && data.containsKey('metadata')) {
      return QuestionModel.fromJson(data);
    }

    final List<dynamic> items;
    if (data is List) {
      items = data;
    } else if (data is Map<String, dynamic> && data['value'] is List) {
      items = data['value'] as List;
    } else {
      throw Exception('Unexpected assessment response format');
    }

    final List<StandardAnswer> standardAnswers = [];
    if (items.isNotEmpty && items.first is Map<String, dynamic>) {
      final dynamic firstAnswers = (items.first as Map<String, dynamic>)['answer'];
      if (firstAnswers is List) {
        for (int index = 0; index < firstAnswers.length; index++) {
          final dynamic answerItem = firstAnswers[index];
          if (answerItem is Map) {
            final String text = answerItem.keys.first.toString();
            standardAnswers.add(StandardAnswer(text: text, value: index));
          }
        }
      }
    }

    final List<Question> questions = [];
    for (int index = 0; index < items.length; index++) {
      final dynamic item = items[index];
      if (item is Map<String, dynamic>) {
        questions.add(
          Question(
            id: index + 1,
            category: 'mental_health',
            desc: (item['desc'] ?? '').toString(),
            question: (item['question'] ?? '').toString(),
          ),
        );
      }
    }

    final metadata = Metadata(
      totalQuestions: questions.length,
      type: lang == 'ar' ? 'تقييم المزاج' : 'Mood Assessment',
      frequencyDays: 14,
      totalScore: 0,
    );

    return QuestionModel(
      metadata: metadata,
      standardAnswers: standardAnswers,
      questions: questions,
    );
  }
}
