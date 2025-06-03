import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:shopmanager_mobile_app/features/splash/bloc/splash_state.dart';
import 'package:shopmanager_mobile_app/injection_container.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 1));

    var hasSignIn = await sl<FirebaseAuthRepository>().hasSignIn();

    if (hasSignIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }    
  }
}
