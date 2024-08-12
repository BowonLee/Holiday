import 'package:holiday/model/event_date/event_date.dart';

import '../../util/datetime_extentions.dart';
import '../consecutive_holidays/consecutive_holidays.dart';

extension ConsecutiveHolidaysParseExtention on List<EventDate> {
  List<ConsecutiveHolidays> toConsecutiveHolidaysList() {
    List<ConsecutiveHolidays> result = [];

    /// 연속된 휴일을 연휴로 묶는다.
    /// * 휴일 리스트를 인자로 받는다. (확장함수이기에 자기 참조 가능)
    /// 1. 대상으로 삼는 인자의 날짜를 저장하고 연휴를 생성한다.
    /// 2. 원소의 일자가 다음날이거나, 주말이면 해당 연휴에 일자를 추가하고 1로 돌아간다
    /// 3. 원소의 일자가 연휴에 해당하지 않으면 새로운 연휴를 생성한다.
    ///
    /// 이 경우 주말부터 시작하는 경우 문제가 될 수 있다.

    int cursor = 0;
    while (cursor < length) {
      EventDate target = this[cursor];
      List<EventDate> dateList = [target];

      int add = 1;
      int weekendAdd = 0;
      while (true) {
        DateTime checkedDate = target.datetime.add(Duration(days: add + weekendAdd));

        if (_isContainDate(checkedDate)) {
          dateList.add(this[cursor + add]);
          add++;
        } else if (checkedDate.isWeekend()) {
          dateList.add(EventDate.fromWeekendDateTime(checkedDate));
          weekendAdd++;
        } else {
          break;
        }
      }

      /// 시작일이 월요일 혹은 일요일인 경우 예외처리 추가
      final firstDate = dateList[0];
      if (firstDate.datetime.weekday == DateTime.monday) {
        dateList
            .add(EventDate.fromWeekendDateTime(firstDate.datetime.add(const Duration(days: -1))));
        dateList
            .add(EventDate.fromWeekendDateTime(firstDate.datetime.add(const Duration(days: -2))));
      } else if (firstDate.datetime.weekday == DateTime.sunday) {
        dateList
            .add(EventDate.fromWeekendDateTime(firstDate.datetime.add(const Duration(days: -1))));
      }

      dateList.sort((a, b) => a.datetime.compareByDate(b.datetime));

      result.add(ConsecutiveHolidays.fromEventDateList(dateList));
      cursor += add;
    }

    return result;
  }

  /// 특정 일자가 해당 배열에 있는지 확인
  /// 정렬 되지 않은 배열이 들어올 경우 판단을 위해 사용
  bool _isContainDate(DateTime target) {
    return map((e) => e.datetime)
            .toList()
            .indexWhere((element) => element.compareByDate(target) == 0) !=
        -1;
  }
}
