import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:logger/logger.dart';

const String HOLIDAY_BOX = "HOLYDAY_BOX";

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  HiveHelper._internal();

  Box<Holiday>? holidayBox;

  factory HiveHelper() {
    return _singleton;
  }

  initHiveManager() async {
    if (Platform.isAndroid || Platform.isIOS) {
      Logger().i("device");
      await Hive.initFlutter();
    } else {
      // await Hive.init(path);
    }

    Hive.registerAdapter(HolidayAdapter());
    await openHolidayBox();
  }

  Future openHolidayBox() async {
    holidayBox = await Hive.openBox(HOLIDAY_BOX);
    Logger().i(holidayBox);
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
