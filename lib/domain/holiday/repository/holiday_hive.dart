import 'package:get_it/get_it.dart';
import 'package:holiday/core/repository/hive/hive_impl.dart';

import '../model/holiday.dart';

const String HOLIDAY_BOX_NAME = "HOLIDAY_BOX";

void setUpHolidayHive() {
  GetIt.instance.registerLazySingleton(() => HolidayHiveService());
}

class HolidayHiveService extends HiveListDataService<Holiday> {
  @override
  String boxName = HOLIDAY_BOX_NAME;
}
