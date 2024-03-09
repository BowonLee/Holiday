extension DateTimeExtention on DateTime {
  bool isSameDate(DateTime target) {
    return (day == target.day && month == target.month && year == target.year);
  }

  /// compare by yyyymmdd past -1 , same 0, future 1
  int compareByDate(DateTime date) {
    return compareTo(date);
  }

  /// past -1 , same 0, future 1
  int compareDateString(String date) {
    return DateTime.parse(date).compareTo(getNowDate());
  }

  /// 시간 없는 날짜 반환
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
    switch (compareByDate(getNowDate())) {
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

  bool isWeekend() {
    return weekday == 6 || weekday == 7;
  }

  String getWeekendString() {
    var weeks = ['월', '화', '수', '목', '금', '토', '일'];

    return weeks[weekday - 1];
  }
}

enum DateState { before, now, after, none }
