// get_it.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => _DioService());
}

class _DioService {
  final dio = Dio();

  // get method
  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
