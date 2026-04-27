import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';

import 'package:novira_app/features/assessment/data/repos/assessement_repo_impl.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit(this._assessementRepoImpl) : super(QuestionInitial());
  final AssessementRepoImpl _assessementRepoImpl;
  QuestionModel? questionModel;
  int currentQuestion = 0;
  int countCompletedAnswers = 0;
  Future<void> fetchQuestions({String lang = "en"}) async {
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

  void updateAnswerValue({
    required int questionIndex,
    required int answersValue,
  }) {
    if (questionModel != null) {
      questionModel!.questions[questionIndex].selectedValue = answersValue;
    }
  }

  void increaseCompletedAnswers() {
    countCompletedAnswers++;
  }

  bool isSelected(int questionIndex) {
    return questionModel!.questions[questionIndex].selectedValue == null
        ? false
        : true;
  }

  void nextQuestion() {
    if (currentQuestion < questionModel!.questions.length - 1) {
      ++currentQuestion;
      emit(QuestionUpdate());
    }
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      currentQuestion--;
      emit(QuestionUpdate());
    }
  }
}
