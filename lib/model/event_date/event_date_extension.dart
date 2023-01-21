import 'package:holiday/model/event_date/event_date.dart';
import 'package:holiday/util/datetime_extentions.dart';

extension EventDateListExtention on List<EventDate> {
  DateState getDateStateByNow() {
    List<DateState> stateList = toDateStateList();

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

extension EventDateListParseExtention on List<EventDate> {
  List<DateTime> toDateTimeList() {
    return map((e) => e.datetime).toList();
  }

  List<String> toDateTitleList() {
    return map((e) => e.name).toList();
  }

  List<DateState> toDateStateList() {
    return map((e) => e.state).toList();
  }
}
