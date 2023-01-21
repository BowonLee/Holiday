extension DateTimeExtention on DateTime {
  /// past 1 , now 0, future -1
  int compareDateString(String date) {
    return DateTime.parse(date).compareTo(getNowDate());
  }

  DateTime getNowDate() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// 시간과 비교하여 상태 반환
  DateState getDateState(DateTime dateTime) {
    switch (compareTo(dateTime)) {
      case -1:
        return DateState.before;
      case 0:
        return DateState.now;
      case 1:
        return DateState.after;
      default:
        return DateState.none;
    }
  }

  /// 현제 시간과 비교하여 상태 반환
  DateState getDateStateByNow() {
    switch (compareTo(DateTime.now())) {
      case -1:
        return DateState.before;
      case 0:
        return DateState.now;
      case 1:
        return DateState.after;
      default:
        return DateState.none;
    }
  }
}

enum DateState { before, now, after, none }
