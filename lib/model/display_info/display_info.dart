import 'package:freezed_annotation/freezed_annotation.dart';

import '../holiday/holiday.dart';

part 'display_info.freezed.dart';

/**
 * 당해년도
 * 총 휴일 수
 * 남은 휴일 수
 * 휴일 목록
 */
@freezed
class DisplayInfo with _$DisplayInfo {
  factory DisplayInfo(
      {required int year,
      required int totalCount,
      required int remainingCount,
      required List<Holiday> closeHoliday}) = _DisplayInfo;
}

extension DisplayInfoExtension on List<Holiday> {
  toDisplayInfo() {
    final year = DateTime.now().year;
    List<Holiday> current = [];
    List<Holiday> next = [];

    forEach((element) {
      if (element.date.contains(year.toString())) {
        current.add(element);
      } else {
        next.add(element);
      }
    });

    List<Holiday> currentWithout = getWithoutWeekend(current);
    List<Holiday> currentRemaining = getRemaining(currentWithout);

    DisplayInfo currentInfo = DisplayInfo(
        year: year,
        totalCount: current.length,
        remainingCount: currentRemaining.length,
        closeHoliday: currentRemaining);

    List<Holiday> nextWithout = getWithoutWeekend(current);
    List<Holiday> nextRemaining = getRemaining(currentWithout);

    DisplayInfo nextInfo = DisplayInfo(
        year: year,
        totalCount: nextWithout.length,
        remainingCount: nextRemaining.length,
        closeHoliday: nextRemaining);

    return [currentInfo, nextInfo];
  }

  // 주말을 제외한 휴일
  List<Holiday> getWithoutWeekend(List<Holiday> origin) {
    return origin.where((element) {
      int weekday = DateTime.parse(element.date).weekday;
      return weekday != 6 && weekday != 7;
    }).toList();
  }

  // 남은 휴일
  List<Holiday> getRemaining(List<Holiday> withoutWeekend) {
    return withoutWeekend
        .where(
            (element) => DateTime.parse(element.date).isAfter(DateTime.now()))
        .toList();
  }
}
