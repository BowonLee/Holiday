import '../consecutive_holidays/consecutive_holidays.dart';
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
      int year = DateTime.parse(element.date).year;
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
      int month = DateTime.parse(element.date).month;
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
      int year = DateTime.parse(element.date).year;
      int month = DateTime.parse(element.date).month;

      int format = year * 100 + month;
      if (result.containsKey(format)) {
        result[format]?.add(element);
      } else {
        result[format] = [element];
      }
    });

    return result;
  }

  /// 주말을 제외한 모든 휴일
  List<Holiday> toWithoutWeekend() {
    return where((element) {
      return DateTime.parse(element.date).weekday != 6 &&
          DateTime.parse(element.date).weekday != 7;
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

  /// 오늘 기준 가장 가까운 휴일
  List<Holiday> toCloseHolidayList() {
    List<Holiday> remainingList = _toRemainingList();

    return [];
  }

  List<Holiday> _toRemainingList() {
    return where((element) {
      return DateTime.parse(element.date).isAfter(DateTime.now());
    }).toList();
  }

  // 연휴 목록으로 가공
  List<ConsecutiveHolidays> toConsecutiveHolidaysList() {
    ///
    List<Holiday> copyList = [...this];
    return [];
  }

  List<Holiday> _getBeforeDays(Holiday pivotDay) {
    //
    return [];
  }

  List<Holiday> _getAfterDays(Holiday pivotDay) {
    return [];
  }

  bool _isHoliday(DateTime dateTime) {
    bool isWeekend = dateTime.weekday == 6 || dateTime.weekday == 6;
    // firstWhere((element) => element.date == dateTime.);
    return false;
  }
}
