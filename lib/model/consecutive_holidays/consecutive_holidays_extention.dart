import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';

import '../../util/datetime_extentions.dart';

extension ConsecutiveHolidaysExtention on ConsecutiveHolidays {
  DateState getDateStateByNow() {
    List<DateState> stateList = dateList.map((e) => e.state).toList();

    if (stateList.contains(DateState.now)) {
      return DateState.now;
    } else if (stateList.contains(DateState.before)) {
      return DateState.before;
    } else if (stateList.contains(DateState.after)) {
      return DateState.after;
    } else {
      return DateState.none;
    }
  }
}

extension ConsecutiveHolidaysListExtention on List<ConsecutiveHolidays> {
  ConsecutiveHolidays getCloseRemainingItem() {
    throw UnimplementedError();
  }
}
