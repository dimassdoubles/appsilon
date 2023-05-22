import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:equatable/equatable.dart';

abstract class ServiceState extends Equatable {}

class ServiceInit extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceLoading extends ServiceState {
  @override
  List<Object?> get props => [];
}

class SuccessGetServiceList extends ServiceState {
  final List<Service> serviceList;

  SuccessGetServiceList(this.serviceList);

  @override
  List<Object?> get props => [serviceList];
}

class ServiceFail extends ServiceState {
  final Failure failure;

  ServiceFail(this.failure);

  @override
  List<Object?> get props => [failure];
}

