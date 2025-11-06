import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';

abstract class AuthRepository {
  Future<String> signUp({required SignupRequest request});
}
