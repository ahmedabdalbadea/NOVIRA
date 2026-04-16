part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionSuccess extends QuestionState {}

final class QuestionFailure extends QuestionState {
  final String errMsg;

  QuestionFailure(this.errMsg);
}
