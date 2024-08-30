import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/datetime_extentions.dart';
import '../../vacation/model/vacation.dart';
import 'holiday.dart';

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

  factory EventDate.fromHoliday(Holiday holiday) {
    return EventDate(
        datetime: holiday.date,
        name: holiday.dateName,
        state: holiday.date.getDateStateByNow(),
        type: EventDateType.holiday);
  }

  factory EventDate.fromVacation(Vacation vacation) {
    return EventDate(
        datetime: vacation.date,
        name: vacation.dateName,
        state: vacation.date.getDateStateByNow(),
        type: EventDateType.vacation);
  }
}

///
/// holiday 공휴일
/// weekend 주말
/// event 기본값
/// vacation 휴가
enum EventDateType { holiday, weekend, event, vacation }
