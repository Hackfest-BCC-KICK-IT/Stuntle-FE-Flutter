part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSucess extends AuthState {}

final class AuthEror extends AuthState {
  final String eror;

  AuthEror(this.eror);
}

final class Authenticated extends AuthState {}

final class Unathenticated extends AuthState {}
