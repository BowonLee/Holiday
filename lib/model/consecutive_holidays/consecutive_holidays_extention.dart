import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';

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
  ConsecutiveHolidays mostRecentItem() {
    return lastWhere(
      (element) => element.state == DateState.past,
    );
  }

  int mostRecentIndex() {
    return lastIndexWhere(
      (element) => element.state == DateState.past,
    );
  }
}
