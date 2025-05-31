import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/entities/auth_user.dart';
import 'package:shopmanager_mobile_app/features/auth/domain/repositories/firebase_auth_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthRepository authRepository;
  AuthUser? _currentUser;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  AuthUser? get currentUser => _currentUser;

  void checkAuth() async {
    emit(AuthLoading());

    final AuthUser? user = await authRepository.getCurrentUser();

    if (user == null) {
      emit(Unauthenticated());
      return;
    }

    _currentUser = user;
    emit(Authenticated(user: user));
  }

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());

      final user =
          await authRepository.signInWithEmailAndPassword(email, password);

      if (user == null) {
        emit(Unauthenticated());
        return;
      }

      _currentUser = user;

      emit(Authenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
