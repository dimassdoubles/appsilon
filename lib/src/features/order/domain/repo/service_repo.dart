import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:dartz/dartz.dart';

abstract class ServiceRepo {
  Future<Either<Failure, List<Service>>> getServiceList(
      {required String subCtgrCode});
}
