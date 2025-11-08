import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopmanager_mobile/features/auth/domain/entities/app_user.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signin_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> deleteAccount() async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) throw Exception('No user logged in.');

      await user.delete();

      await logout();
    } catch (e) {
      throw Exception('Failed to delete account: $e');
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;

    if (user == null) return null;

    return AppUser(uid: user.uid, email: user.email!);
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset email! Check your inbox.';
    } catch (e) {
      throw Exception('An error occurred on reset password : $e');
    }
  }

  @override
  Future<String> signIn(SigninRequest request) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  @override
  Future<String> signUp(SignupRequest request) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }
}
