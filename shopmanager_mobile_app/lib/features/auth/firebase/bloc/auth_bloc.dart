import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/authentication_repository.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthState(user: authenticationRepository.currentUserModel)) {
    on<AuthUserSubscriptionRequested>(_onAuthUserSubscriptionRequested);
    on<AuthLogoutPressed>(_onAuthLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onAuthUserSubscriptionRequested(
    AuthUserSubscriptionRequested event,
    Emitter<AuthState> emit,
  ) async {
    return emit.onEach(
      _authenticationRepository.user,
      onData: (user) => emit(AuthState(user: user)),
      onError: addError,
    );
  }

  void _onAuthLogoutPressed(
    AuthLogoutPressed event,
    Emitter<AuthState> emit,
  ) {
    _authenticationRepository.logOut();
  }
}
