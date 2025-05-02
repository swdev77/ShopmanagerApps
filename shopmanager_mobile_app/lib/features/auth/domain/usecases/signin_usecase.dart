import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/core/usecases/usecase.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/signin_request.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class SigninUsecase implements Usecase<Either, SigninRequest> {
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});

  @override
  Future<Either> call({SigninRequest? param}) async {
    if (param == null) {
      return left('Sign in parameters can not be empty');
    }

    return await authRepository.signin(request: param);
  }
}
