import 'dart:developer';

import 'package:appsilon/src/features/order/data/data_source/parfume_remote_source.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/repo/parfume_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ParfumeRepo)
class ParfumeRepoImpl implements ParfumeRepo {
  final ParfumeRemoteSource _remoteSource;

  ParfumeRepoImpl({required ParfumeRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<Either<Failure, List<Parfume>>> getParfumeList() async {
    try {
      log("parfumerepoimpl getparfumelist");
      final result = await _remoteSource.getParfumeList();

      return Right(result);
    } catch (e) {
      log(e.toString());
      return Left(UnhandledFailure(e.toString()));
    }
  }
}
