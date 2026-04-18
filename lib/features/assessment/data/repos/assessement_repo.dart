import 'package:dartz/dartz.dart';
import 'package:novira_app/core/errors/failure.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';

abstract class AssessementRepo {
  Future<Either<Failure, QuestionModel>> fetchQuestion(String lang);
}
