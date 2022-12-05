import 'package:freezed_annotation/freezed_annotation.dart';

/// date : "2022-01-01"
/// dateName : "1월1일"
/// dateKind : "국경일"
/// isHoliday : true
part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
class Holiday with _$Holiday {
  factory Holiday(
      {required String date,
      required String dateName,
      required String dateKind,
      required bool isHoliday}) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
}
