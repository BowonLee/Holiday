import 'package:freezed_annotation/freezed_annotation.dart';

import '../display_info/display_info.dart';

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

extension DisplayInfoExtension on List<Holiday> {
  toDisplayInfo(String year, List<Holiday> origin) {
    List<Holiday> withoutWeekend = origin.where((element) {
      int weekday = DateTime.parse(element.date).weekday;
      return weekday != 6 && weekday != 7;
    }).toList();

    List<Holiday> remaining = withoutWeekend
        .where(
            (element) => DateTime.parse(element.date).isAfter(DateTime.now()))
        .toList();

    return DisplayInfo(
        year: year,
        totalCount: withoutWeekend.length,
        remaining: remaining.length,
        closeHoliday: remaining);
  }
}
