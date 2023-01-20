import 'package:freezed_annotation/freezed_annotation.dart';

import '../holiday/holiday.dart';

part 'consecutive_holidays.freezed.dart';

@freezed
class ConsecutiveHolidays with _$ConsecutiveHolidays {
  factory ConsecutiveHolidays(
      {required String title,
      required List<Holiday> holidayList,
      required ConsecutiveHolidaysState state}) = _ConsecutiveHolidays;

  ConsecutiveHolidays._();
}

enum ConsecutiveHolidaysState { before, now, after }
