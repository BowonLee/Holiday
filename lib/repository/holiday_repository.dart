import '../client/rest_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';

class HolidayRepository {
  HiveHelper hiveHelper;
  RestClient client;

  HolidayRepository({required this.hiveHelper, required this.client});

  Future setHolidayList() async {}

  Future<List<Holiday>> getHolidayList() async {
    List<Holiday> fromHive = await hiveHelper.read();

    if (fromHive.isEmpty) {
      return client.getHolidayList();
    } else {
      return fromHive;
    }
  }
}
