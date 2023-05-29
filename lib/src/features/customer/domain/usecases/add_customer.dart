import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/customer/domain/repo/customer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCustomer {
  final CustomerRepo _repo;

  const AddCustomer({required CustomerRepo repo}) : _repo = repo;

  Future<Either<Failure, void>> call(
      {required String name, required String phone}) {
    return _repo.addCustomer(name: name, phone: phone);
  }
}
