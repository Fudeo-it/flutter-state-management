part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class InitialSignInState extends SignInState  {
  const InitialSignInState();
}

final class PerformingSignInState extends SignInState {
  const PerformingSignInState();
}

final class PerformedSignInState extends SignInState {
  const PerformedSignInState();
}

final class ErrorPerformingSignInState extends SignInState {
  final String error;

  const ErrorPerformingSignInState(this.error);

  @override
  List<Object> get props => [error];
}