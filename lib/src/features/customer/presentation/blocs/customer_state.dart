import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
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

class SuccessGetCustomerList extends CustomerState {
  final List<Customer> listCustomer;

  SuccessGetCustomerList({required this.listCustomer});

  @override
  List<Object?> get props => [listCustomer];
}
