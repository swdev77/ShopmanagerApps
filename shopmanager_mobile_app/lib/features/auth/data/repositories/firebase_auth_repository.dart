import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/auth_user.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuthUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AuthUser authUser = userCredential.user!.toAuthUser();

      return authUser;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword(
      String username, String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AuthUser authUser = userCredential.user!.toAuthUser();

      return authUser;
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  @override
  Future<AuthUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) return null;

    return firebaseUser.toAuthUser();
  }

  @override
  Future<bool> hasSignIn() async {
    return firebaseAuth.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset email sent successfully. Check your inbox.';
    } catch (e) {
      throw Exception('Password reset email failed: $e');
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in.');
      }

      await user.delete();

      await signOut();
    } catch (e) {
      throw Exception('Delete account failed: $e');
    }
  }
}

extension FirebaseAuthUserExtension on User {
  AuthUser toAuthUser() {
    return AuthUser(uid: uid, email: email ?? '');
  }
}
