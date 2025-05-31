import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shopmanager_mobile_app/core/constants/api_url_constants.dart';
import 'package:shopmanager_mobile_app/core/network/dio_client.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/login_request.dart';

abstract class AuthApiService {
  Future<Either> signin(LoginRequest signinRequest);
}

class AuthApiServiceImpl implements AuthApiService {
  final DioClient dioClient;

  AuthApiServiceImpl({required this.dioClient});

  @override
  Future<Either> signin(LoginRequest signinRequest) async {
    try {
      final response = await dioClient.post(
        ApiUrlConstants.loginEndpoint,
        data: signinRequest.toMap(),
      );

      return right(response);
    } on DioException catch (e) {
      return left(e.response?.data['message'] ?? 'Unknown error occurred');
    }
  }
}
