import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/authentication/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOut {
  final AuthRepo _authRepo;

  SignOut({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<Either<Failure, void>> call() {
    return _authRepo.signOut();
  }
}
