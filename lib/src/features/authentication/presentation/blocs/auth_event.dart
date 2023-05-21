abstract class AuthEvent {}

class EvSignIn extends AuthEvent {
  final String username, password;

  EvSignIn({required this.username, required this.password});
}

class EvSignOut extends AuthEvent {}
