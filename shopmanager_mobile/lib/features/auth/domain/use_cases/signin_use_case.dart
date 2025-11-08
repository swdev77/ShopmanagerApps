import 'package:shopmanager_mobile/features/auth/domain/models/signin_request.dart';
import 'package:shopmanager_mobile/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<String> execute({required String email, required String password}) async {
    return await authRepository.signIn(
      SigninRequest(email: email, password: password),
    );
  }
}
