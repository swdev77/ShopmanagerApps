import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/core/usecases/usecase.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/login_request.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';

class SigninUsecase implements Usecase<Either, LoginRequest> {
  final FirebaseAuthRepository authRepository;

  SigninUsecase({required this.authRepository});

  @override
  Future<Either> call({LoginRequest? param}) async {
    if (param == null) {
      return left('Sign in parameters can not be empty');
    }

    return const Left('Sign in use case not implemented yet');
  }
}
