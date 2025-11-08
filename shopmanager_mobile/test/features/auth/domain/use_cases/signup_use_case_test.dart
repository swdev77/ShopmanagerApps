import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/use_cases/signup_use_case.dart';

import '../../../../helpers/constants.dart';
import 'auth_repository_mock.dart';

void main() {
  group('Sing Up tests', () {
    setUpAll(() {
      registerFallbackValue(
        SignupRequest(
          username: UserConstants.username,
          email: UserConstants.email,
          password: UserConstants.password,
        ),
      );
    });
    test('should sign up user and return user id', () async {
      final mockAuthRepository = MockAuthRepository();

      final singUpUseCase = SignUpUseCase(authRepository: mockAuthRepository);

      when(
        () => mockAuthRepository.signUp(any()),
      ).thenAnswer((_) async => UserConstants.userId);

      final result = await singUpUseCase.execute(
        username: UserConstants.username,
        email: UserConstants.email,
        password: UserConstants.password,
      );

      expect(result, UserConstants.userId);

      verify(
        () => mockAuthRepository.signUp(any()),
      ).called(1);
    });
  });
}
