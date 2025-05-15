import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/splash/bloc/splash_state.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 1));

    var isLoggedIn = await sl<AuthenticationRepository>().isLoggedIn();

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }    
  }
}
