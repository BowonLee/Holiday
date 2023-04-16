import 'package:hive_flutter/hive_flutter.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:logger/logger.dart';

const String HOLIDAY_BOX = "HOLYDAY_BOX";

const String META_BOX = "META_BOX";

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  HiveHelper._internal();

  Box<Holiday>? holidayBox;
  Box? metaBox;

  factory HiveHelper() {
    return _singleton;
  }

  initHiveManager() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HolidayAdapter());
    await openHolidayBox();
    await openMetaBox();
  }

  Future openHolidayBox() async {
    holidayBox = await Hive.openBox(HOLIDAY_BOX);
    Logger().i(holidayBox);
  }

  Future openMetaBox() async {
    metaBox = await Hive.openBox(META_BOX);
    Logger().i(metaBox);
  }

  Future save(Holiday value) async {
    return holidayBox?.add(value);
  }

  Future saveAll(List<Holiday> values) async {
    Logger().i(holidayBox);

    return holidayBox?.addAll(values);
  }

  Future<List<Holiday>> readAll() async {
    return holidayBox?.values.toList() ?? [];
  }

  Future clear() async {
    return holidayBox?.clear();
  }
}
/**
 * single table
 * id
 * date
 * dateName
 * dateKind
 * isHoliday
 *
 *
 */

/**
 *  해당 정보를 받은 시점
 */
