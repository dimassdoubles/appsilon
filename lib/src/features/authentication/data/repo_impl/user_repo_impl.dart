import 'dart:developer';

import 'package:appsilon/src/constants/errors/failures.dart';
import 'package:appsilon/src/features/authentication/data/data_source/auth_remote_source.dart';
import 'package:appsilon/src/features/authentication/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSource _remoteSource;

  AuthRepoImpl({required AuthRemoteSource remoteSource})
      : _remoteSource = remoteSource;

  @override
  Future<Either<Failure, void>> signIn(
      {required String username, required String password}) async {
    try {
      final result =
          await _remoteSource.signIn(username: username, password: password);
      return Right(result);
    } on AuthException catch (e) {
      log(e.message);
      return Left(AuthFailure(e.message));
    } catch (e) {
      log(e.toString());
      return Left(UnhandledFailure(e.toString()));
    }
  }
}
