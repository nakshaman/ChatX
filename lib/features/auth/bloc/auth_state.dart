part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

abstract class AuthActionState extends AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final AppUser user;
  AuthSuccessState({required this.user});
}

final class AuthErrorState extends AuthState {}

final class LoginToSignUpScreenState extends AuthActionState {}

final class SignUpToLogInScreenState extends AuthActionState {}

final class LoginToForgotPasswordScreenState extends AuthActionState {}
