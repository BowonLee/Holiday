import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:retrofit/http.dart';

import 'dio_service.dart';

part 'rest_client.g.dart';

void setUpClient() {
  final dio = GetIt.instance.get<DioService>().dio;
  GetIt.instance.registerLazySingleton(() => RestClient(dio));
}

@RestApi(baseUrl: "http://10.0.2.2:8080/api/holiday")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/list')
  Future<List<Holiday>> getHolidayList();
}
