import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:logger/logger.dart';

import '../../../core/util/datetime_extentions.dart';
import 'event_date.dart';

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

    if (list.length > 1) {
      holidaysString += " 연휴";
    }

    /// 연휴 마지막날의 상태가 bofore라면 before
    /// 연휴 의 첫날이 after인경우 after

    DateState currentState = DateState.none;

    if (list.indexWhere((element) => element.state == DateState.now) != -1) {
      currentState = DateState.now;
    } else if (list.last.state == DateState.past) {
      currentState = DateState.past;
    } else if (list.first.state == DateState.future) {
      currentState = DateState.future;
    }

    return ConsecutiveHolidays(title: "$holidaysString", dateList: list, state: currentState);
  }
}
