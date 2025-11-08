import 'package:shopmanager_mobile/features/auth/domain/entities/app_user.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signin_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<String> signUp(SignupRequest request) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<String> signIn(SigninRequest request) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<String> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
}