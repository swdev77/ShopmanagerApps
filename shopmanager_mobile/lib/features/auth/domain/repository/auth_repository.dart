import 'package:shopmanager_mobile/features/auth/domain/entities/app_user.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signin_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';

abstract class AuthRepository {
  Future<String> signUp(SignupRequest request);

  Future<String> signIn(SigninRequest request);

  Future<void> logout();

  Future<String> sendPasswordResetEmail(String email);

  Future<AppUser?> getCurrentUser();
  Future<void> deleteAccount();
}
