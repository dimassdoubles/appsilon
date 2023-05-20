import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signIn(
      {required String username, required String password});
}
