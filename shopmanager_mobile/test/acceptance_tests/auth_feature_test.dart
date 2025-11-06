import 'package:flutter_test/flutter_test.dart';
import 'package:shopmanager_mobile/features/auth/data/repository/auth_repository_impl.dart';
import 'package:shopmanager_mobile/features/auth/domain/use_cases/signin_use_case.dart';
import 'package:shopmanager_mobile/features/auth/domain/use_cases/signup_use_case.dart';

import '../helpers/constants.dart';

void main() {
  group('Auth feature tests', () {
    test('sign up use case should register user and return user id', () async {
      final AuthRepositoryImpl authRepository = AuthRepositoryImpl();
      
      final SignUpUseCase signUpUseCase = SignUpUseCase(
        authRepository: authRepository,
      );

      final result = await signUpUseCase.execute(
        username: UserConstants.username,
        email: UserConstants.email,
        password: UserConstants.password,
      );

      expect(result, UserConstants.userId);
    });

    test('sign in use case', () async {
      
      final SignInUseCase signInUseCase = SignInUseCase(
      ); 
      
      final result = signInUseCase.execute();
       
    });
  });
}

