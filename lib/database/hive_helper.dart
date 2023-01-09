import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:holiday/model/holiday/holiday.dart';

const String HOLIDAY_BOX = "HOLYDAY_BOX";

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  HiveHelper._internal();

  Box<Holiday>? holidayBox;
  static initHiveManager() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await Hive.initFlutter();
    } else {
      Hive.initFlutter();
    }
  }

  factory HiveHelper() {
    return _singleton;
  }

  Future openHolidayBox() async {
    holidayBox = await Hive.openBox(HOLIDAY_BOX);
  }

  Future create(Holiday value) async {
    return holidayBox?.add(value);
  }

  Future<List<Holiday>> read() async {
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
