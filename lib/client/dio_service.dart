// get_it.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setupDio() {
  GetIt.instance.registerLazySingleton(() => DioService());
}

class DioService {
  final dio = Dio();

  // get method
  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}
