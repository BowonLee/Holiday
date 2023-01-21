import 'package:holiday/model/event_date/event_date.dart';
import 'package:holiday/util/datetime_extentions.dart';

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

  List<EventDate> _toEventDateList() {
    return map((holiday) => holiday.toEventDate()).toList();
  }

  // 연휴 목록으로 가공
  List<ConsecutiveHolidays> toConsecutiveHolidaysList() {
    // 현제 리스트를 카피하는 리스트 생성
    // 1. 해당일 기준으로 검사 시작
    // 2. 해당일 시점 휴일 검사
    // 3. 해당일 뒤로 검사 및
    // 4. 이미 포함 된 휴일은 제거
    List<EventDate> eventDateList = _toEventDateList();

    return [];
  }

  ConsecutiveHolidays _getConsecutiveHolidays(Holiday pivotDay) {
    List<EventDate> eventDateList = _toEventDateList();
    String title = "";
    List<EventDate> result = [];

    return ConsecutiveHolidays(
        title: title, dateList: result, state: DateState.after);
  }

  List<EventDate> _getBeforeDays(Holiday pivotDay) {
    // 1. 반복문 시작
    // 2. 하루씩 앞으로로 간다.
    // 3. 해당일이 휴일아면 result 에 추가한 뒤 1로
    // 4. 해당일이 휴일이 아니면 반복 종료
    List<EventDate> result = [
      pivotDay.toEventDate(pivotDay.toDatetime().getDateStateByNow())
    ];
    Holiday current = pivotDay.copyWith();

    current.toDatetime().add(const Duration(days: 1));
    while (_isHoliday(current)) {}

    return result;
  }

  List<EventDate> _getAfterDays(Holiday pivotDay) {
    // 1. 반복문 시작
    // 2. 하루씩 앞으로 간다.
    // 3. 해당일이 휴일아면 result 에 추가한 뒤 1로
    // 4. 해당일이 휴일이 아니면 반복 종료
    return [];
  }

  bool _isHoliday(Holiday holiday) {
    DateTime dateTime = holiday.toDatetime();
    bool isWeekend = dateTime.weekday == 6 || dateTime.weekday == 7;
    int find =
        indexWhere((element) => dateTime.compareDateString(element.date) == 0);

    return isWeekend && find != -1;
  }
}
