import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

const int serverTimeoutSecond = 3;

void setupDio() {
  GetIt.instance.registerLazySingleton(() => DioService());
}

class DioService {
  final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: serverTimeoutSecond)));
}
