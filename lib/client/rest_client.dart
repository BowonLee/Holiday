import 'package:dio/dio.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://localhost:8080/api/holiday")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/list')
  Future<List<Holiday>> getHolidayList();
}
