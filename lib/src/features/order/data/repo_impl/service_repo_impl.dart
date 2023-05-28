import 'dart:developer' hide Service;

import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/data/data_source/service_remote_source.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/domain/repo/service_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ServiceRepo)
class ServiceRepoImpl implements ServiceRepo {
  final ServiceRemoteSource _remoteSource;

  const ServiceRepoImpl({required ServiceRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<Either<Failure, List<Service>>> getServiceList(
      {required String subCtgrCode}) async {
    try {
      log("getServiceList");
      final result = await _remoteSource.getServiceList(subCtgrCode: subCtgrCode);

      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(UnhandledFailure(e.toString()));
    }
  }
}
