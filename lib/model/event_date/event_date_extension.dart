import 'package:holiday/model/event_date/event_date.dart';

import '../../util/datetime_extentions.dart';
import '../consecutive_holidays/consecutive_holidays.dart';

extension ConsecutiveHolidaysParseExtention on List<EventDate> {
  List<ConsecutiveHolidays> toConsecutiveHolidaysList() {
    List<ConsecutiveHolidays> result = [];

    /// 휴일은 여기에서 추가합니다. 해당 리스트는 날짜순으로 정렬되어 있다고 가정합니다.
    /// 1. 휴일 리스트를 순서대로 순회한다.
    /// 2. 해당일 전일을 검사하여 주말을 추가한다. <- 이건 마지막에 해도 상관없나?
    /// 3. 해당일 다음날부터 검사하여 다른 휴일 및 주말을 추가한다.
    /// 4. 다른 휴일이 해당 리스트에 추가되는 경우 리스트에서 제외한다.
    /// 5. 연속된 휴일이 없는 경우 해당 루프를 종료한 뒤 하나의 연휴로 묶는다.
    /// 6. 연휴의 이름은 포함 된 공휴일의 이름을 추가한다.
    /// 7. 연휴가 1일인 경우 휴일의 이음, 2일 이상인 경우 휴일이름 + 연휴 이다.

    int cursor = 0;
    while (cursor < length) {
      EventDate target = this[cursor];
      List<EventDate> dateList = [target];

      int add = 1;
      int weekendAdd = 0;
      while (true) {
        DateTime tempDate =
            target.datetime.add(Duration(days: add + weekendAdd));

        if (_isContainDate(tempDate)) {
          dateList.add(this[cursor + add]);
          add++;
        } else if (tempDate.isWeekend()) {
          dateList.add(EventDate.fromWeekendDateTime(tempDate));
          weekendAdd++;
        } else {
          break;
        }
      }

      if (dateList[0].datetime.weekday == 1) {
        dateList.add(EventDate.fromWeekendDateTime(
            dateList[0].datetime.add(const Duration(days: -1))));
        dateList.add(EventDate.fromWeekendDateTime(
            dateList[0].datetime.add(const Duration(days: -2))));
      }

      dateList.sort((a, b) => a.datetime.compareByDate(b.datetime));

      result.add(ConsecutiveHolidays.fromEventDateList(dateList));
      cursor += add;
    }

    return result;
  }

  bool _isContainDate(DateTime target) {
    return map((e) => e.datetime)
            .toList()
            .indexWhere((element) => element.compareByDate(target) == 0) !=
        -1;
  }
}
