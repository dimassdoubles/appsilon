// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appsilon/src/features/authentication/data/data_source/auth_remote_source.dart'
    as _i3;
import 'package:appsilon/src/features/authentication/data/repo_impl/user_repo_impl.dart'
    as _i5;
import 'package:appsilon/src/features/authentication/domain/repo/auth_repo.dart'
    as _i4;
import 'package:appsilon/src/features/authentication/domain/usecases/sign_in.dart'
    as _i6;
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthRemoteSource>(() => _i3.SupabaseAuthSource());
    gh.singleton<_i4.AuthRepo>(
        _i5.AuthRepoImpl(remoteSource: gh<_i3.AuthRemoteSource>()));
    gh.factory<_i6.SignIn>(() => _i6.SignIn(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(signIn: gh<_i6.SignIn>()));
    return this;
  }
}
