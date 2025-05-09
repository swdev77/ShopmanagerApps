part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

final class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel user;

  const AuthState({UserModel user = UserModel.empty})
    : this._( 
        status: user == UserModel.empty 
          ? AuthStatus.unauthenticated
          : AuthStatus.authenticated, 
        user: user,
      );

  const AuthState._({required this.status, this.user = UserModel.empty});

  @override
  List<Object?> get props => [status, user];
}
