import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:retrofit/http.dart';

import '../domain/init/model/update_datetime.dart';
import '../core/repository/client/dio_service.dart';

part 'metadata_client.g.dart';

void setUpMetaClient() {
  final dio = GetIt.instance.get<DioService>().dio;
  GetIt.instance.registerLazySingleton(() => MetaDataClient(dio));
}

@RestApi(baseUrl: "http://10.0.2.2:8080/api/meta")
abstract class MetaDataClient {
  factory MetaDataClient(Dio dio, {String baseUrl}) = _MetaDataClient;

  @POST('/updateDate')
  Future<List<UpdateDateTime>> getLastUpdateTimeList();
}
