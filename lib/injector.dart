import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/datasources/Local/LocalDataSource.dart';
import 'app/data/datasources/Remote/RemoteDataSource.dart';
import 'app/data/repositories/AuthRepositoryImpl.dart';
import 'app/data/repositories/MainRepositoryImpl.dart';
import 'app/domain/repositories/AuthRepository.dart';
import 'app/domain/repositories/MainRepository.dart';
import 'app/presentation/cubits/Auth/auth_cubit.dart';
import 'app/presentation/cubits/Main/main_cubit.dart';
import 'core/network/NetworkInfo.dart';
import 'core/validators/validator.dart';

GetIt g = GetIt.instance;

Future<void> configureInjector(String env) async {
  // Cubits
  g.registerFactory<AuthCubit>(
      () => AuthCubit(authRepository: g(), validator: g()));
  g.registerFactory<MainCubit>(
      () => MainCubit(mainRepository: g(), validator: g()));
  g.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        localDataSource: g(),
        remoteDataSource: g(),
        networkInfo: g(),
      ));
  g.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(
        localDataSource: g(),
        remoteDataSource: g(),
        networkInfo: g(),
      ));
  // Data Sources
  g.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(g()));
  g.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  g.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(g()));

  //Others
  g.registerLazySingleton<Validator>(
      () => ValidatorImpl(networkInfo: g(), remoteDataSource: g()));

  final sharedPreferences = await SharedPreferences.getInstance();
  g.registerLazySingleton(() => sharedPreferences);
  g.registerLazySingleton(() => Dio());
  g.registerLazySingleton(() => DataConnectionChecker());
}
