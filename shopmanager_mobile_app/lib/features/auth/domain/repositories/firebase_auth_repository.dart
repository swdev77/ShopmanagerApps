import 'package:shopmanager_mobile_app/features/auth/domain/entities/auth_user.dart';

abstract class FirebaseAuthRepository {
  Future<AuthUser?> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<AuthUser?> signUpWithEmailAndPassword(
    String username,
    String email,
    String password,
  );

  Future<void> signOut();
  Future<AuthUser?> getCurrentUser();

  Future<bool> hasSignIn();

  Future<String> sendPasswordResetEmail(String email);

  Future<void> deleteAccount();
}
