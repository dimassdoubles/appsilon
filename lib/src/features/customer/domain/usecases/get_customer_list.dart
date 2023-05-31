import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/customer/domain/repo/customer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCustomerList {
  final CustomerRepo _repo;

  const GetCustomerList({required CustomerRepo repo}) : _repo = repo;

  Future<Either<Failure, List<Customer>>> call({String? keyword}) {
    return _repo.getCustomerList(keyword: keyword);
  }
}
