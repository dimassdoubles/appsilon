import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInit extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthFail extends AuthState {
  final Failure failure;

  AuthFail(this.failure);

  @override
  List<Object?> get props => [failure];
}

class AuthSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}
