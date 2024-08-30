import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/holiday/model/holiday.dart';
import '../../../domain/vacation/model/vacation.dart';

const String HOLIDAY_BOX = "HOLIDAY_BOX";

const String VACATION_BOX = "VACATION_BOX";

const String META_BOX = "META_BOX";

const String lastHolidayUpdateDatetimeKey = "lastHolidayUpdateDatetime";

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  HiveHelper._internal();

  Box<Holiday>? holidayBox;
  Box? metaBox;
  Box<Vacation>? vacationBox;

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
  }

  Future<void> openMetaBox() async {
    metaBox = await Hive.openBox(META_BOX);
  }

  Future<void> openVacationBox() async {
    vacationBox = await Hive.openBox(VACATION_BOX);
  }

  Future<int>? setHoliday(Holiday value) {
    return holidayBox?.add(value);
  }

  Future<Iterable<int>>? setHolidayList(List<Holiday> values) {
    return holidayBox?.addAll(values);
  }

  List<Holiday>? getHolidayList() {
    return holidayBox?.values.toList();
  }

  Future<int>? clearHolidayList() {
    return holidayBox?.clear();
  }

  Future<void>? setLastHolidayUpdateDatetime(DateTime updateDatetime) {
    return metaBox?.put(lastHolidayUpdateDatetimeKey, updateDatetime);
  }

  DateTime? getLastHolidayUpdateDatetime() {
    return metaBox?.get(lastHolidayUpdateDatetimeKey);
  }

  Future<int>? setVacation(Vacation value) {
    return vacationBox?.add(value);
  }

  Future<Iterable<int>>? setVacationList(List<Vacation> values) {
    return vacationBox?.addAll(values);
  }

  List<Vacation>? getVacationList() {
    return vacationBox?.values.toList();
  }

  Future<int>? clearVacationList() {
    return vacationBox?.clear();
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
