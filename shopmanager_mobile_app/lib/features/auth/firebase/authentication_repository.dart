import 'package:flutter/foundation.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/errors/failures.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/models/user.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    CacheClient? cacheClient,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) : _cacheClient = cacheClient ?? CacheClient(),
       _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance;

  final CacheClient _cacheClient;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @visibleForTesting
  bool isWeb = kIsWeb;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return UserModel.empty;
      }
      final userModel = firebaseUser.toUserModel;
      _cacheClient.write(key: userCacheKey, value: userModel);
      return userModel;
    });
  }

  UserModel get currentUserModel => _firebaseAuth.currentUser == null
      ? UserModel.empty
      : _firebaseAuth.currentUser!.toUserModel;

  // _cacheClient.read<UserModel>(key: userCacheKey) ?? UserModel.empty;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        await _googleSignIn.initialize();
        final account = await _googleSignIn.authenticate(
          scopeHint: ['email', 'profile'],
        );
        final authClient = _googleSignIn.authorizationClient;
        final authorization = await authClient.authorizationForScopes(
           ['email'],
        );
        final googleAuth = account.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: authorization?.accessToken,
          idToken: googleAuth.idToken,
        );
      }
      await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user != null;
    } catch (_) {
      return false;
    }
  }
}

extension on firebase_auth.User {
  UserModel get toUserModel =>
      UserModel(id: uid, email: email, name: displayName, photo: photoURL);
}
