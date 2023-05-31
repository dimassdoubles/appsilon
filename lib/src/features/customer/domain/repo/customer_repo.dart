import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepo {
  Future<Either<Failure, void>> addCustomer(
      {required String name, required String phone});

  Future<Either<Failure, List<Customer>>> getCustomerList({String? keyword});
}
