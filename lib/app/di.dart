


import 'package:get_it/get_it.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/data/dataSource/app_api.dart';
import 'package:kratos/data/dataSource/db_helper.dart';
import 'package:kratos/data/dataSource/local_data_source.dart';
import 'package:kratos/data/repository/repositry_imp.dart';
import 'package:kratos/domain/repository/repository.dart';
import 'package:kratos/domain/usecase/login_usecase.dart';
import 'package:kratos/domain/usecase/register_usecase.dart';
import 'package:kratos/presentation/login/bloc/login_bloc.dart';
import 'package:kratos/presentation/register/bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final sqlHelper= SqlDb();
  instance.registerLazySingleton<SqlDb>(() => sqlHelper);
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));



  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClientImpl(instance()));

  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(instance()));
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<KratosLoginCubit>(() => KratosLoginCubit(instance()));

  }
}



initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<KratosRegisterCubit>(() => KratosRegisterCubit(instance()));

  }
}







