import 'package:logger/logger.dart';

import '../client/rest_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';

class HolidayRepository {
  RestClient client;

  HolidayRepository({required this.client});

  Future setHolidayList() async {}

  Future<List<Holiday>> getHolidayList() async {
    List<Holiday> fromHive = await HiveHelper().readAll();

    if (fromHive.isEmpty) {
      Logger().i("from server");
      List<Holiday> _fromServer = await client.getHolidayList();
      HiveHelper().saveAll(_fromServer);
      return _fromServer;
    } else {
      Logger().i("from db");
      return fromHive;
    }
  }
}
