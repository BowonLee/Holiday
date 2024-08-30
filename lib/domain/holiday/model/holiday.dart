import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'event_date.dart';

/// 공휴일, 국경일
part 'holiday.freezed.dart';

part 'holiday.g.dart';

@freezed
abstract class HolidayResponse with _$HolidayResponse {
  const factory HolidayResponse(
      {required List<Holiday> holidayList, required DateTime lastUpdateTime}) = _HolidayResponse;

  factory HolidayResponse.fromJson(Map<String, dynamic> json) => _$HolidayResponseFromJson(json);
}

@freezed
abstract class Holiday with _$Holiday {
  @HiveType(typeId: 1, adapterName: "HolidayAdapter")
  factory Holiday({
    @JsonKey(name: "date", required: true) @HiveField(0) required DateTime date,
    @HiveField(1) required String dateName,
    @HiveField(2) required String dateKind,
    @HiveField(3) required bool isHoliday,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) => _$HolidayFromJson(json);

  Holiday._();
}
