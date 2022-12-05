import 'package:freezed_annotation/freezed_annotation.dart';

import '../holiday/holiday.dart';

part 'display_info.freezed.dart';

@freezed
class DisplayInfo with _$DisplayInfo {
  factory DisplayInfo(
      {required String year,
      required int totalCount,
      required int remaining,
      required List<Holiday> closeHoliday}) = _DisplayInfo;
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
