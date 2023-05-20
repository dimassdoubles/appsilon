import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/authentication/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignIn {
  final AuthRepo _authRepo;

  SignIn({required AuthRepo authRepo}) : _authRepo = authRepo;

  Future<Either<Failure, void>> call(
      {required String username, required String password}) {
    return _authRepo.signIn(username: username, password: password);
  }
}
