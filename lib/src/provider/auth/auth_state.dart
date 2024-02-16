import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool? loggedIn;

  const AuthState({
    required this.loggedIn,
  });

  const AuthState.initial({
    this.loggedIn = null,
  });

  AuthState updateLoggedIn(
    bool loggedIn,
  ) {
    return AuthState(
      loggedIn: loggedIn,
    );
  }

  @override
  List<Object?> get props => [loggedIn];
}
