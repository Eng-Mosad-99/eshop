import 'package:dio/dio.dart';
import 'package:eshop/core/networking/dio_factory.dart';
import 'package:eshop/features/auth/data/repos/auth_repo.dart';
import 'package:eshop/features/auth/data/services/auth_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupDependencies() {
  _setupAuth();
}

_setupAuth() {
  getIt.registerSingleton<Dio>(DioFactory().dio);
  getIt.registerSingleton<AuthService>(AuthService(getIt()));
  getIt.registerSingleton<AuthRepo>(AuthRepo(service: getIt()));
}
