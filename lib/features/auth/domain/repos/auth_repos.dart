import 'package:chatx/models/app_user.dart';

abstract class AuthRepos {
  Future<AppUser?> loginWithEmailPassword();
  Future<AppUser?> signupWithEmailPassword();
  Future<AppUser?> getCurrentUser();
  Future<AppUser?> forgotPassword();
}
