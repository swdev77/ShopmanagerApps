import 'package:shopmanager_mobile/features/auth/domain/models/signup_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  Future<String> execute({
    required String username,
    required String email,
    required String password,
  }) async {
    return await authRepository.signUp(
      SignupRequest(
        username: username,
        email: email,
        password: password,
      ),
    );
  }
}
