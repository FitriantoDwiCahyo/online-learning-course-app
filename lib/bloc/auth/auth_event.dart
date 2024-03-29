part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent{
  String email;
  String password;

  SignInEvent(this.email,this.password);
}

class SignOutEvent extends AuthEvent{}