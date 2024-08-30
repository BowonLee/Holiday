import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/consecutive_holidays.dart';
import '../model/event_date.dart';

class ConsecutiveHolidaysPeriod extends StatelessWidget {
  const ConsecutiveHolidaysPeriod({
    super.key,
    required this.consecutiveHolidays,
  });

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Text(
      _getDateString(consecutiveHolidays.dateList),
      style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
    );
  }

  String _getDateString(List<EventDate> dateList) {
    String dateStr = "";
    if (dateList.length == 1) {
      dateStr = DateFormat("M/d(E)").format(dateList.first.datetime);
    } else {
      dateStr =
          "${DateFormat("M/d(E)").format(dateList.first.datetime)} ~ ${DateFormat("M/d(E)").format(dateList.last.datetime)}";
    }
    return dateStr;
  }
}
