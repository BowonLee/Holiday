import '../client/rest_client.dart';
import '../database/sql_manager.dart';
import '../model/holiday/holiday.dart';

class HolidayRepository {
  SQLManager manager;
  RestClient client;

  HolidayRepository({required this.manager, required this.client});

  Future<List<Map<String, dynamic>>> getHolidayList() async {
    List<Holiday>? result;

    final fromDB = await manager.getHoliday();
    if (fromDB.isEmpty) {
      result = await client.getHolidayList();
      manager.insertHolidayList(result);
    } else {
      // result = fromDB.map<Holiday>((e) => Holiday.fromJson(e));
    }

    return [];
  }
}
