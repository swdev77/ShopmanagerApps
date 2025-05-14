import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/errors/failures.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/email.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/password.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _authenticationRepository;

  SignInCubit(this._authenticationRepository) : super(const SignInState());

  void emailChanged(String value) => emit(state.withEmail(value));
  void passwordChanged(String value) => emit(state.withPassword(value));

  Future<void> signInWithCredentials() async {
    if (!state.isValid) return;

    emit(state.withSubmissionInProgress());

    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.withSubmissionInSuccess());
      
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }
}
