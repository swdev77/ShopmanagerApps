import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopmanager_mobile_app/features/auth/data/sources/auth_api_service.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/login_request.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService authApiService;
  const AuthRepositoryImpl({required this.authApiService});

  @override
  Future<Either> login({required LoginRequest request}) async {
    final signinResponse = await authApiService.signin(request);

    return signinResponse.fold(
      (error) {
        return left(error);
      },
      (data) async {
        Response response = data as Response;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('sm_api_token', response.data['token']);

        return right(data);
      },
    );
  }
}
