import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';

import 'package:novira_app/features/assessment/data/repos/assessement_repo_impl.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this._assessementRepoImpl) : super(QuestionInitial());
  final AssessementRepoImpl _assessementRepoImpl;
  QuestionModel? questionModel;
  Future<void> fetchQuestions({String lang = "ar"}) async {
    emit(QuestionLoading());
    var data = await _assessementRepoImpl.fetchQuestion(lang);
    data.fold(
      (failure) {
        emit(QuestionFailure(failure.errMsg));
      },
      (questions) {
        questionModel = questions;
        emit(QuestionSuccess());
      },
    );
  }
}
