import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/login_request.dart';

abstract class AuthRepository {
  Future<Either> login({required LoginRequest request});
}
