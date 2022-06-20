// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i8;
import 'core/domain/utils/network/network_info.dart' as _i7;
import 'core/presentation/blocs/auth/auth_bloc.dart' as _i24;
import 'features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i10;
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i11;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i13;
import 'features/auth/domain/repositories/auth_repository.dart' as _i12;
import 'features/auth/domain/usecases/change_password_use_case.dart' as _i14;
import 'features/auth/domain/usecases/edit_personal_info_use_case.dart' as _i15;
import 'features/auth/domain/usecases/forget_password_use_case.dart' as _i16;
import 'features/auth/domain/usecases/get_first_time_logged_use_case.dart'
    as _i17;
import 'features/auth/domain/usecases/get_signed_in_user_use_case.dart' as _i18;
import 'features/auth/domain/usecases/login_use_case.dart' as _i19;
import 'features/auth/domain/usecases/logout_use_case.dart' as _i20;
import 'features/auth/domain/usecases/set_first_time_logged_use_case.dart'
    as _i21;
import 'features/auth/domain/usecases/sign_up_use_case.dart' as _i22;
import 'features/auth/domain/usecases/subscribe_to_auth_status.dart' as _i23;
import 'injectable_module.dart' as _i25;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i3.Configuration>(() => injectableModule.configuration);
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i10.AuthLocalDatasource>(
      () => _i10.AuthLocalDatasourceImpl(get<_i9.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i11.AuthRemoteDataSource>(() =>
      _i11.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
      get<_i10.AuthLocalDatasource>(),
      get<_i11.AuthRemoteDataSource>(),
      get<_i7.NetworkInfo>(),
      get<_i6.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i14.ChangePasswordUseCase>(
      () => _i14.ChangePasswordUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i15.EditPersonalInfoUseCase>(
      () => _i15.EditPersonalInfoUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i16.ForgetPasswordUseCase>(
      () => _i16.ForgetPasswordUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i17.GetFirstTimeLoggedUseCase>(
      () => _i17.GetFirstTimeLoggedUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i18.GetSignedInUserUseCase>(
      () => _i18.GetSignedInUserUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i19.LoginUseCase>(
      () => _i19.LoginUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(repository: get<_i12.AuthRepository>()));
  gh.lazySingleton<_i21.SetFirstTimeLoggedUseCase>(
      () => _i21.SetFirstTimeLoggedUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i22.SignUpUseCase>(
      () => _i22.SignUpUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i23.SubscribeToAuthStatusUseCase>(
      () => _i23.SubscribeToAuthStatusUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i24.AuthBloc>(() => _i24.AuthBloc(
      get<_i18.GetSignedInUserUseCase>(),
      get<_i20.LogoutUseCase>(),
      get<_i17.GetFirstTimeLoggedUseCase>(),
      get<_i21.SetFirstTimeLoggedUseCase>(),
      get<_i23.SubscribeToAuthStatusUseCase>()));
  return get;
}

class _$InjectableModule extends _i25.InjectableModule {}
