import 'package:airbnb_checkin/models/user/user.dart';
import 'package:equatable/equatable.dart';

sealed class AuthStatus extends Equatable {
  const AuthStatus();

  @override
  List<Object?> get props => [];
}

final class AuthenticatedAuthStatus extends AuthStatus {
  final User user;

  const AuthenticatedAuthStatus(this.user);

  @override
  List<Object?> get props => [user];
}

final class NotAuthenticatedAuthStatus extends AuthStatus {
  const NotAuthenticatedAuthStatus();
}