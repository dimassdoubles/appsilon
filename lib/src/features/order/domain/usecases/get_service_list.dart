import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/domain/repo/service_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetServiceList {
  final ServiceRepo _repo;

  const GetServiceList({required ServiceRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Service>>> call({required String subCtgrId}) {
    return _repo.getServiceList(subCtgrId: subCtgrId);
  }
}
