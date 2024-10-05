import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/holiday/model/holiday.dart';
import '../../../domain/holiday/repository/holiday_hive.dart';
import '../../../domain/init/client/metadata_hive.dart';
import '../../../domain/vacation/model/vacation.dart';
import '../../../domain/vacation/repository/vacation_hive.dart';
import 'hive_impl.dart';

const String VACATION_BOX = "VACATION_BOX";

const String META_BOX = "META_BOX";

const String lastHolidayUpdateDatetimeKey = "lastHolidayUpdateDatetime";

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  HiveHelper._internal();

  Box? metaBox;
  Box<Vacation>? vacationBox;

  factory HiveHelper() {
    return _singleton;
  }

  /// hive 사용을 위해 앱 시작 전 수행해야 할 작업들
  runInitTasks() async {
    await Hive.initFlutter();

    registerAdapters();
    await openAllBoxes();
  }

  registerAdapters() {
    Hive.registerAdapter(HolidayAdapter());
    Hive.registerAdapter(VacationAdapter());
  }

  Future<void> openAllBoxes() {
    return Future.wait([
      Hive.openBox<Holiday>(HOLIDAY_BOX_NAME),
      Hive.openBox(VACATION_BOX_NAME),
      Hive.openBox(METADATA_BOX_NAME)
    ]);
  }

  Future<void> openMetaBox() async {
    metaBox = await Hive.openBox(META_BOX);
  }

  Future<void> openVacationBox() async {
    vacationBox = await Hive.openBox(VACATION_BOX);
  }

  Future<void>? setLastHolidayUpdateDatetime(DateTime updateDatetime) {
    return metaBox?.put(lastHolidayUpdateDatetimeKey, updateDatetime);
  }

  DateTime? getLastHolidayUpdateDatetime() {
    return metaBox?.get(lastHolidayUpdateDatetimeKey);
  }

  Future<Iterable<int>>? setVacationList(List<Vacation> values) {
    return vacationBox?.addAll(values);
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
