import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday/model/event_date/event_date.dart';

import '../../util/datetime_extentions.dart';

part 'consecutive_holidays.freezed.dart';

@freezed
class ConsecutiveHolidays with _$ConsecutiveHolidays {
  factory ConsecutiveHolidays(
      {required String title,
      required List<EventDate> dateList,
      required DateState state}) = _ConsecutiveHolidays;

  ConsecutiveHolidays._();
}
