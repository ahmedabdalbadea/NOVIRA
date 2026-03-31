part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMsg;

  SignUpFailure(this.errMsg);
}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInFailure extends AuthState {
  final String errMsg;

  LogInFailure(this.errMsg);
}
