import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';

class UserConstants {
  static const String username = 'username';
  static const String password = 'password123';
  static const String email = 'username@mail.com';
  static String userId = 'userId123';

  static final SignupRequest signupRequest = SignupRequest(
    username: username,
    email: email,
    password: password,
  );
}

