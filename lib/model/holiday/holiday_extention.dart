import 'package:holiday/model/event_date/event_date.dart';
import 'package:holiday/util/datetime_extentions.dart';

import 'holiday.dart';

/// list를 사용하여 표현되는 타입
/// 데이터 타입에 종속적이지 않는건 장점이다.
/// 변경에 용이하나 강제적이지 않다
/// 주말을 포함 한 모든 휴일 수
/// 주말을 제외한 모든 휴일 수
/// 주말로 인해 날아간 휴일 수
/// 대체공휴일 수
/// 남은 휴일 수
/// 가장 가까운 휴일
/// 휴일 목록 월별, 연도별
extension HolidayListDivideExtension on List<Holiday> {
  /// 휴일 목록 연도별 YYYY
  Map<int, List<Holiday>> divideByYear() {
    Map<int, List<Holiday>> result = {};

    forEach((element) {
      int year = element.toDatetime().year;
      if (result.containsKey(year)) {
        result[year]?.add(element);
      } else {
        result[year] = [element];
      }
    });

    return result;
  }

  /// 휴일 목록 월별 MM
  Map<int, List<Holiday>> divideByMonth() {
    Map<int, List<Holiday>> result = {};

    forEach((element) {
      int month = element.toDatetime().month;
      if (result.containsKey(month)) {
        result[month]?.add(element);
      } else {
        result[month] = [element];
      }
    });

    return result;
  }

  /// 휴일 목록 연도 + 월 YYYYMM
  Map<int, List<Holiday>> divideByYearAndMonth() {
    Map<int, List<Holiday>> result = {};

    forEach((element) {
      int year = element.toDatetime().year;
      int month = element.toDatetime().month;

      int format = year * 100 + month;
      if (result.containsKey(format)) {
        result[format]?.add(element);
      } else {
        result[format] = [element];
      }
    });

    return result;
  }
}

extension HolidayListParseExtension on List<Holiday> {
  /// 주말을 제외한 모든 휴일
  List<Holiday> toWithoutWeekend() {
    return where((element) {
      return element.toDatetime().weekday != 6 &&
          element.toDatetime().weekday != 7;
    }).toList();
  }

  /// 대체공휴일
  List<Holiday> toSubstituteList() {
    return where((element) {
      return element.dateName == "대체 공휴일";
    }).toList();
  }

  /// 남은 휴일 수
  List<Holiday> toRemainingList() {
    return _toRemainingList();
  }

  List<Holiday> _toRemainingList() {
    return where((element) {
      return element.toDatetime().isAfter(DateTime.now());
    }).toList();
  }

  List<EventDate> toEventDateList() {
    return map((holiday) => holiday.toEventDate()).toList();
  }

  bool _isHoliday(Holiday holiday) {
    DateTime dateTime = holiday.toDatetime();
    bool isWeekend = dateTime.weekday == 6 || dateTime.weekday == 7;
    int find =
        indexWhere((element) => dateTime.compareDateString(element.date) == 0);

    return isWeekend && find != -1;
  }
}
