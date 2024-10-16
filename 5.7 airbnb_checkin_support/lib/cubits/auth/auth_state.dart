part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class CheckingAuthState extends AuthState {
  const CheckingAuthState();
}

final class AuthenticatedAuthState extends AuthState {
  final User user;

  const AuthenticatedAuthState(this.user);

  @override
  List<Object?> get props => [user];
}

final class NotAuthenticatedAuthState extends AuthState {
  const NotAuthenticatedAuthState();
}