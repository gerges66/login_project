import 'package:auth_app/core/utils/api_service.dart';
import 'package:auth_app/features/login/data/repositories/repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt locator=GetIt.instance;
Future<void> setupLocator() async{
  locator.registerLazySingleton(()=>ApiService(Dio()));
  locator.registerSingleton(()=>LoginRepoImplemention(locator<ApiService>()));
}