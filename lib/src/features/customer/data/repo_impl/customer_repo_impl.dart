import 'dart:developer';

import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/customer/data/data_source/customer_remote_source.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/customer/domain/repo/customer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CustomerRepo)
class CustomerRepoImpl implements CustomerRepo {
  final CustomerRemoteSource _remoteSource;

  CustomerRepoImpl({required CustomerRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<Either<Failure, void>> addCustomer(
      {required String name, required String phone}) async {
    try {
      await _remoteSource.addCustomer(name: name, phone: phone);

      return const Right(null);
    } catch (e) {
      log("${e.runtimeType}, ${e.toString()}");
      return Left(UnhandledFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> getCustomerList(
      {String? keyword}) async {
    try {
      final result = await _remoteSource.getCustomerList(keyword: keyword);

      return Right(result);
    } catch (e) {
      log("${e.runtimeType}, ${e.toString()}");
      return Left(UnhandledFailure(e.toString()));
    }
  }
}
