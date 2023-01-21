import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:holiday/util/datetime_extentions.dart';

import '../event_date/EventDate.dart';

/// date : "2022-01-01"
/// dateName : "1월1일"
/// dateKind : "국경일"
/// isHoliday : true
part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
abstract class Holiday with _$Holiday {
  @HiveType(typeId: 1, adapterName: "HolidayAdapter")
  factory Holiday({
    @JsonKey(name: "date", required: true) @HiveField(0) required String date,
    @HiveField(1) required String dateName,
    @HiveField(2) required String dateKind,
    @HiveField(3) required bool isHoliday,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  Holiday._();

  DateTime toDatetime() {
    return DateTime.parse(date);
  }

  EventDate toEventDate([DateState? state]) {
    return EventDate(
        datetime: DateTime.parse(date),
        name: dateName,
        state: state ?? DateState.none);
  }
}
