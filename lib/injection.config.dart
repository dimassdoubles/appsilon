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
    as _i15;
import 'package:appsilon/src/features/authentication/domain/usecases/sign_out.dart'
    as _i16;
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart'
    as _i18;
import 'package:appsilon/src/features/customer/data/data_source/customer_remote_source.dart'
    as _i6;
import 'package:appsilon/src/features/customer/data/repo_impl/customer_repo_impl.dart'
    as _i8;
import 'package:appsilon/src/features/customer/domain/repo/customer_repo.dart'
    as _i7;
import 'package:appsilon/src/features/customer/domain/usecases/add_customer.dart'
    as _i17;
import 'package:appsilon/src/features/customer/presentation/blocs/customer_bloc.dart'
    as _i19;
import 'package:appsilon/src/features/order/data/data_source/parfume_remote_source.dart'
    as _i9;
import 'package:appsilon/src/features/order/data/data_source/service_remote_source.dart'
    as _i12;
import 'package:appsilon/src/features/order/data/repo_impl/parfume_repo_impl.dart'
    as _i11;
import 'package:appsilon/src/features/order/data/repo_impl/service_repo_impl.dart'
    as _i14;
import 'package:appsilon/src/features/order/domain/repo/parfume_repo.dart'
    as _i10;
import 'package:appsilon/src/features/order/domain/repo/service_repo.dart'
    as _i13;
import 'package:appsilon/src/features/order/domain/usecases/get_parfume_list.dart'
    as _i20;
import 'package:appsilon/src/features/order/domain/usecases/get_service_list.dart'
    as _i21;
import 'package:appsilon/src/features/order/presentation/blocs/parfume_bloc.dart'
    as _i22;
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart'
    as _i23;
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
    gh.factory<_i6.CustomerRemoteSource>(() => _i6.SupabaseCustomerSource());
    gh.factory<_i7.CustomerRepo>(() =>
        _i8.CustomerRepoImpl(remoteSource: gh<_i6.CustomerRemoteSource>()));
    gh.factory<_i9.ParfumeRemoteSource>(() => _i9.SupabaseParfumeSource());
    gh.factory<_i10.ParfumeRepo>(() =>
        _i11.ParfumeRepoImpl(remoteSource: gh<_i9.ParfumeRemoteSource>()));
    gh.factory<_i12.ServiceRemoteSource>(() => _i12.SupabaseServiceSource());
    gh.factory<_i13.ServiceRepo>(() =>
        _i14.ServiceRepoImpl(remoteSource: gh<_i12.ServiceRemoteSource>()));
    gh.factory<_i15.SignIn>(() => _i15.SignIn(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i16.SignOut>(() => _i16.SignOut(authRepo: gh<_i4.AuthRepo>()));
    gh.factory<_i17.AddCustomer>(
        () => _i17.AddCustomer(repo: gh<_i7.CustomerRepo>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          signIn: gh<_i15.SignIn>(),
          signOut: gh<_i16.SignOut>(),
        ));
    gh.factory<_i19.CustomerBloc>(
        () => _i19.CustomerBloc(addCustomer: gh<_i17.AddCustomer>()));
    gh.factory<_i20.GetParfumeList>(
        () => _i20.GetParfumeList(repo: gh<_i10.ParfumeRepo>()));
    gh.factory<_i21.GetServiceList>(
        () => _i21.GetServiceList(repo: gh<_i13.ServiceRepo>()));
    gh.factory<_i22.ParfumeBloc>(
        () => _i22.ParfumeBloc(getParfumeList: gh<_i20.GetParfumeList>()));
    gh.factory<_i23.ServiceBloc>(
        () => _i23.ServiceBloc(getServiceList: gh<_i21.GetServiceList>()));
    return this;
  }
}
