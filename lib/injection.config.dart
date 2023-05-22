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
    as _i9;
import 'package:appsilon/src/features/authentication/domain/usecases/sign_out.dart'
    as _i10;
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart'
    as _i11;
import 'package:appsilon/src/features/order/data/data_source/service_remote_source.dart'
    as _i6;
import 'package:appsilon/src/features/order/data/repo_impl/service_repo_impl.dart'
    as _i8;
import 'package:appsilon/src/features/order/domain/repo/service_repo.dart'
    as _i7;
import 'package:appsilon/src/features/order/domain/usecases/get_service_list.dart'
    as _i12;
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart'
    as _i13;
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
    gh.factory<_i6.ServiceRemoteSource>(() => _i6.SupabaseServiceSource());
    gh.factory<_i7.ServiceRepo>(
        () => _i8.ServiceRepoImpl(remoteSource: gh<_i6.ServiceRemoteSource>()));
    gh.factory<_i9.SignIn>(() => _i9.SignIn(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i10.SignOut>(() => _i10.SignOut(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(
          signIn: gh<_i9.SignIn>(),
          signOut: gh<_i10.SignOut>(),
        ));
    gh.factory<_i12.GetServiceList>(
        () => _i12.GetServiceList(repo: gh<_i7.ServiceRepo>()));
    gh.factory<_i13.ServiceBloc>(
        () => _i13.ServiceBloc(getServiceList: gh<_i12.GetServiceList>()));
    return this;
  }
}
