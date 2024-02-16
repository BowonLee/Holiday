import 'package:hive_flutter/hive_flutter.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:logger/logger.dart';

const String HOLIDAY_BOX = "HOLYDAY_BOX";

const String META_BOX = "META_BOX";

const String lastHolidayUpdateDatetimeKey = "lastHolidayUpdateDatetime";

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

  Future<void> openHolidayBox() async {
    holidayBox = await Hive.openBox(HOLIDAY_BOX);
    Logger().i(holidayBox);
  }

  Future<void> openMetaBox() async {
    metaBox = await Hive.openBox(META_BOX);
    Logger().i(metaBox);
  }

  Future<int>? setHoliday(Holiday value) {
    return holidayBox?.add(value);
  }

  Future<Iterable<int>>? setHolidayList(List<Holiday> values) {
    return holidayBox?.addAll(values);
  }

  List<Holiday> getHolidayList() {
    return holidayBox?.values.toList() ?? [];
  }

  Future<int>? clearHolidayList() {
    return holidayBox?.clear();
  }

  Future<void>? setLastHolidayUpdateDatetime(DateTime updateDatetime) {
    return metaBox?.put(lastHolidayUpdateDatetimeKey, updateDatetime);
  }

  Future<DateTime?> getLastHolidayUpdateDatetime() {
    return metaBox?.get(lastHolidayUpdateDatetimeKey);
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
