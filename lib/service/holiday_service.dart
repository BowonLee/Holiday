import 'package:dio/dio.dart';

import '../client/holiday_client.dart';
import '../database/hive_helper.dart';

class HolidayService {
  /**
   * 1. 서버에서 정보 받아오기
   * 2. 데이터베이스에 정보 저장하기
   * 3. 저장된 정보 가져오가
   * 4. 저장된 정보가 없을 시
   */
  HiveHelper hiveHelper;

  HolidayService({required this.hiveHelper});

  void getHolidayInfo() {}

  Future<void> getHoliday() async {
    final dio = Dio();

    final client = HolidayClient(dio);

    final result = await client.getHolidayList();
  }

  void setDataToDB() {}
}
