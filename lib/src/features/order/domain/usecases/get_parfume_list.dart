import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/order/domain/models/parfume.dart';
import 'package:appsilon/src/features/order/domain/repo/parfume_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetParfumeList {
  final ParfumeRepo _repo;

  GetParfumeList({required ParfumeRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Parfume>>> call() {
    return _repo.getParfumeList();
  }
}
