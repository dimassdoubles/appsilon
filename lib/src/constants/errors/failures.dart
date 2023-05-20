import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class UnhandledFailure extends Failure {
  const UnhandledFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);

  @override
  List<Object?> get props => [message];
}
