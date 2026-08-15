import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatx/models/app_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthNavigateToSignUp>(authNavigateToSignUp);
    on<AuthNavigateToLogIn>(authNavigateToLogIn);
    on<AuthNavigateToForgotPassword>(authNavigateToForgotPassword);
    on<AuthLoginRequestedEvent>(authLoginRequestedEvent);
  }

  FutureOr<void> authNavigateToSignUp(
    AuthNavigateToSignUp event,
    Emitter<AuthState> emit,
  ) {
    emit(LoginToSignUpScreenState());
  }

  FutureOr<void> authNavigateToLogIn(
    AuthNavigateToLogIn event,
    Emitter<AuthState> emit,
  ) {
    emit(SignUpToLogInScreenState());
  }

  FutureOr<void> authNavigateToForgotPassword(
    AuthNavigateToForgotPassword event,
    Emitter<AuthState> emit,
  ) {
    emit(LoginToForgotPasswordScreenState());
  }

  FutureOr<void> authLoginRequestedEvent(
    AuthLoginRequestedEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthLoadingState());
    
  }
}
