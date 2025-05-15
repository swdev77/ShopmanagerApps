import 'package:shopmanager_mobile_app/features/auth/firebase/models/user.dart';

abstract class UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserModel userModel;

  UserInfoLoaded({required this.userModel});
}

class UserInfoFailure extends UserInfoState {
  final String? error;

  UserInfoFailure(this.error);
}

class UserInfoEmpty extends UserInfoState {}
