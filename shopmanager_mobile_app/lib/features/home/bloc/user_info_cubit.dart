import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/home/bloc/user_info_state.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoLoading());

  void fetchUserInfo() async {
    emit(UserInfoLoading());
    try {
      var user = sl<AuthenticationRepository>().currentUserModel;
      emit(UserInfoLoaded(userModel: user));
    } catch (e) {
      emit(UserInfoFailure('Failed on fetching user info'));
    }
  }

  Future<void> userLogout() async {
    await sl<AuthenticationRepository>().logOut();
    emit(UserInfoEmpty());
  }
}
