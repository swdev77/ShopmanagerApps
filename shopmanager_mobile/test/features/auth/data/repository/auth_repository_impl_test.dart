import 'package:flutter_test/flutter_test.dart';
import 'package:shopmanager_mobile/features/auth/data/repository/auth_repository_impl.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';

import '../../../../helpers/constants.dart';

void main() {
  group('auth repository impl ...', () {
    test('sign up should ', () async {
      final authRepository = AuthRepositoryImpl();

      final result = await authRepository.signUp(
        SignupRequest(
          username: UserConstants.username,
          email: UserConstants.email,
          password: UserConstants.password,
        ),
      );

      expect(result, UserConstants.userId);
    });
  });
}
