import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:dartz/dartz.dart';

abstract class ParfumeRepo {
  Future<Either<Failure, List<Parfume>>> getParfumeList();
}
