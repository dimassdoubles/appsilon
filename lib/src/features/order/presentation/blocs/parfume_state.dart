import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:equatable/equatable.dart';

abstract class ParfumeState extends Equatable {}

class ParfumeInit extends ParfumeState {
  @override
  List<Object?> get props => [];
}

class ParfumeLoading extends ParfumeState {
  @override
  List<Object?> get props => [];
}

class ParfumeFail extends ParfumeState {
  final Failure failure;

  ParfumeFail(this.failure);

  @override
  List<Object?> get props => [failure];
}

class SuccessGetParfumeList extends ParfumeState {
  final List<Parfume> parfumeList;

  SuccessGetParfumeList(this.parfumeList);

  @override
  List<Object?> get props => [parfumeList];
}
