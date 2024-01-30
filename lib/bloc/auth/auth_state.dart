part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  String email;
  String password;

  AuthSuccess(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

final class AuthError extends AuthState {
  String error;
  AuthError(this.error);

  @override
  List<Object> get props => [error];
}
