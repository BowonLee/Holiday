import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday/model/event_date/event_date.dart';
import 'package:logger/logger.dart';

import '../../util/datetime_extentions.dart';

part 'consecutive_holidays.freezed.dart';

@freezed
class ConsecutiveHolidays with _$ConsecutiveHolidays {
  factory ConsecutiveHolidays(
      {required String title,
      required List<EventDate> dateList,
      required DateState state}) = _ConsecutiveHolidays;

  ConsecutiveHolidays._();

  factory ConsecutiveHolidays.fromEventDateList(List<EventDate> list) {
    String holidaysString = list
        .where((element) => element.type == EventDateType.holiday)
        .map((e) => e.name)
        .toSet()
        .join(",");

    Logger().i(list);
    // if (now.datetime.add(const Duration(days: -1)).isWeekend()) {
    //   // now.datetime.add(Duration(days: -1)
    //   dateList.add(EventDate.fromWeekendDateTime(
    //       now.datetime.add(const Duration(days: -1))));
    //   dateList.add(EventDate.fromWeekendDateTime(
    //       now.datetime.add(const Duration(days: -2))));
    // }
    // UnimplementedError();
    return ConsecutiveHolidays(
        title: "$holidaysString 연휴", dateList: list, state: DateState.none);
  }
}
