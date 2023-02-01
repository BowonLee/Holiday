import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/datetime_extentions.dart';

part 'event_date.freezed.dart';

/// 주말, 공휴일, 휴가를 포함하는 Event 추가
@freezed
class EventDate with _$EventDate {
  factory EventDate({
    required DateTime datetime,
    required String name,
    @Default(EventDateType.event) EventDateType type,
    @Default(DateState.none) DateState state,
  }) = _EventDate;

  EventDate._();

  // EventDate fromWeekendDateTime()
  factory EventDate.fromWeekendDateTime(DateTime dateTime) {
    return EventDate(
        datetime: dateTime,
        name: "주말",
        type: EventDateType.weekend,
        state: dateTime.getDateStateByNow());
  }
}

enum EventDateType { holiday, weekend, event }