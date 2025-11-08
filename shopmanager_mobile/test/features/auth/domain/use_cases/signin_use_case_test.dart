import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopmanager_mobile/features/auth/domain/models/signin_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/use_cases/signin_use_case.dart';

import '../../../../helpers/constants.dart';
import 'auth_repository_mock.dart';

void main() {
  group('sign in ... ', () {
    setUpAll(() {
      registerFallbackValue(
        SigninRequest(
          email: UserConstants.email,
          password: UserConstants.password,
        ),
      );
    });
    test('should ...', () async {
      final mockAuthRepository = MockAuthRepository();

      final useSignInCase = SignInUseCase(authRepository: mockAuthRepository);

      when(
        () => mockAuthRepository.signIn(any()),
      ).thenAnswer((_) async => UserConstants.userId);

      final result = await useSignInCase.execute(
        email: UserConstants.email,
        password: UserConstants.password,
      );

      verify(() => mockAuthRepository.signIn(any())).called(1);

      expect(result, UserConstants.userId);
    });
  });
}
