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
    as _i12;
import 'package:appsilon/src/features/authentication/domain/usecases/sign_out.dart'
    as _i13;
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart'
    as _i14;
import 'package:appsilon/src/features/order/data/data_source/parfume_remote_source.dart'
    as _i6;
import 'package:appsilon/src/features/order/data/data_source/service_remote_source.dart'
    as _i9;
import 'package:appsilon/src/features/order/data/repo_impl/parfume_repo_impl.dart'
    as _i8;
import 'package:appsilon/src/features/order/data/repo_impl/service_repo_impl.dart'
    as _i11;
import 'package:appsilon/src/features/order/domain/repo/parfume_repo.dart'
    as _i7;
import 'package:appsilon/src/features/order/domain/repo/service_repo.dart'
    as _i10;
import 'package:appsilon/src/features/order/domain/usecases/get_parfume_list.dart'
    as _i15;
import 'package:appsilon/src/features/order/domain/usecases/get_service_list.dart'
    as _i16;
import 'package:appsilon/src/features/order/presentation/blocs/parfume_bloc.dart'
    as _i17;
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart'
    as _i18;
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
    gh.factory<_i6.ParfumeRemoteSource>(() => _i6.SupabaseParfumeSource());
    gh.factory<_i7.ParfumeRepo>(
        () => _i8.ParfumeRepoImpl(remoteSource: gh<_i6.ParfumeRemoteSource>()));
    gh.factory<_i9.ServiceRemoteSource>(() => _i9.SupabaseServiceSource());
    gh.factory<_i10.ServiceRepo>(() =>
        _i11.ServiceRepoImpl(remoteSource: gh<_i9.ServiceRemoteSource>()));
    gh.factory<_i12.SignIn>(() => _i12.SignIn(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i13.SignOut>(() => _i13.SignOut(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          signIn: gh<_i12.SignIn>(),
          signOut: gh<_i13.SignOut>(),
        ));
    gh.factory<_i15.GetParfumeList>(
        () => _i15.GetParfumeList(repo: gh<_i7.ParfumeRepo>()));
    gh.factory<_i16.GetServiceList>(
        () => _i16.GetServiceList(repo: gh<_i10.ServiceRepo>()));
    gh.factory<_i17.ParfumeBloc>(
        () => _i17.ParfumeBloc(getParfumeList: gh<_i15.GetParfumeList>()));
    gh.factory<_i18.ServiceBloc>(
        () => _i18.ServiceBloc(getServiceList: gh<_i16.GetServiceList>()));
    return this;
  }
}
