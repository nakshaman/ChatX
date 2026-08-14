part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequestedEvent extends AuthEvent {}

final class AuthSignupRequestedEvent extends AuthEvent {}

final class AuthNavigateToSignUp extends AuthEvent {}

final class AuthNavigateToLogIn extends AuthEvent {}
