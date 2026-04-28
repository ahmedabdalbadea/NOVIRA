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

  Future<void> fetchQuestions({String lang = 'en'}) async {
    emit(QuestionLoading());
    final data = await _assessementRepoImpl.fetchQuestion(lang);
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
    return questionModel!.questions[questionIndex].selectedValue != null;
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

  Map<String, dynamic> calculateResults() {
    int totalScore = 0;

    if (questionModel != null) {
      for (final question in questionModel!.questions) {
        totalScore += question.selectedValue ?? 0;
      }
    }

    const maxScore = 27;
    final double rateOutOfTen = (totalScore * 10 / maxScore).clamp(0, 10);

    String status = '';
    String recommendation = '';

    if (totalScore <= 4) {
      status = 'Excellent';
      recommendation = 'Keep up your wellness routine!';
    } else if (totalScore <= 9) {
      status = 'Good';
      recommendation = 'Continue your healthy habits.';
    } else if (totalScore <= 14) {
      status = 'Moderate';
      recommendation = 'Consider consulting a healthcare provider.';
    } else if (totalScore <= 19) {
      status = 'Concerning';
      recommendation = 'Please consult a healthcare professional.';
    } else {
      status = 'Severe';
      recommendation = 'It\'s important to seek professional help immediately.';
    }

    return {
      'score': totalScore,
      'maxScore': maxScore,
      'rate': rateOutOfTen,
      'status': status,
      'recommendation': recommendation,
      'needsDoctor': totalScore > 14,
    };
  }
}
