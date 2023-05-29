import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {}

class CustomerInit extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerLoading extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerFail extends CustomerState {
  final Failure failure;

  CustomerFail({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class SuccessAddCustomer extends CustomerState {
  @override
  List<Object?> get props => [];
}
