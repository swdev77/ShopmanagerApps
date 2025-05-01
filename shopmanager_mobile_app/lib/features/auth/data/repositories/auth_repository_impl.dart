import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/features/auth/data/sources/auth_api_service.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/signin_request.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;
  const AuthRepositoryImpl({required this.authApiService});
  @override
  Future<Either> signin({required SigninRequest request}) {
    
    return authApiService.signin(request).then((response) {
      return response.fold(
        (error) => left(error),
        (data) => right(data),
      );
    });
  }
}
