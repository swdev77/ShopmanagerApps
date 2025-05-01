import 'package:dartz/dartz.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/signin_request.dart';

abstract class AuthRepository {
  Future<Either> signin({required SigninRequest request});
}
