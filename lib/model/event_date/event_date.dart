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
}

enum EventDateType { holiday, weekend, event }
