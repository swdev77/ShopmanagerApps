import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/errors/failures.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/email.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/password.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/validations/password_comfirmed.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) => emit(state.withEmail(value));
  void passwordChanged(String value) => emit(state.withPassword(value));
  void confirmedPasswordChanged(String value) =>
      emit(state.withConfirmedPassword(value));

  Future<void> sigUpFormSubmitted() async {
    if (!state.isValid) return;

    emit(state.withSubmissionInProgress());

    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.withSubmissionSuccess());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }
}
