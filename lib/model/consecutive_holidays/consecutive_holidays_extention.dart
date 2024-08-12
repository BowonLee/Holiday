import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date.dart';
import 'package:logger/logger.dart';

import '../../util/datetime_extentions.dart';

extension ConsecutiveHolidaysExtention on ConsecutiveHolidays {
  DateState getDateStateByNow() {
    List<DateState> stateList = dateList.map((e) => e.state).toList();

    if (stateList.contains(DateState.now)) {
      return DateState.now;
    } else if (stateList.contains(DateState.past)) {
      return DateState.past;
    } else if (stateList.contains(DateState.future)) {
      return DateState.future;
    } else {
      return DateState.none;
    }
  }
}

extension ConsecutiveHolidaysListExtention on List<ConsecutiveHolidays> {
  List<EventDate> toEventDateList() {
    return fold<List<EventDate>>(
      <EventDate>[],
      (previousValue, element) => previousValue..addAll(element.dateList),
    );
  }

  int findIndexByDatetime(DateTime datetime) {
    return indexWhere(
      (consecutiveHolidays) =>
          consecutiveHolidays.dateList.indexWhere(
            (element) => element.datetime.compareByDate(datetime) == 1,
          ) !=
          -1,
    );
    ;
  }

  /// 오늘을 기준으로 가장 가까운 연휴 정보 반환
  /// 상태가 현제를 가진 값을 가지고 있거나,
  ConsecutiveHolidays getUpcomingItem() {
    int index = indexWhere((element) => element.state == DateState.now);

    if (index == -1) {
      index = indexWhere((element) => element.state == DateState.future);
    }

    return this[index];
  }

  int getUpcomingIndex() {
    int index = indexWhere((element) => element.state == DateState.now);

    if (index == -1) {
      index = indexWhere((element) => element.state == DateState.future);
    }

    return index;
  }

  /// 오늘을 기준으로 직전 휴일
  ConsecutiveHolidays getMostRecentItem() {
    return lastWhere(
      (element) => element.state == DateState.past,
    );
  }

  int getMostRecentIndex() {
    return lastIndexWhere(
      (element) => element.state == DateState.past,
    );
  }
}
