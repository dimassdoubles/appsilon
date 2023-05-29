import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepo {
  Future<Either<Failure, void>> addCustomer(
      {required String name, required String phone});
}
