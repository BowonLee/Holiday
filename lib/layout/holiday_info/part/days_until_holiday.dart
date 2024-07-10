part of '../holiday_info_layout.dart';

class DaysUntilHoliday extends StatelessWidget {
  const DaysUntilHoliday({super.key, required this.consecutiveHolidays});

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Text(
          consecutiveHolidays.title,
          style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
        ),
        Text(
          _getDateString(consecutiveHolidays.dateList),
          style: GoogleFonts.sunflower(textStyle: TextStyle(fontSize: 25)),
        ),
        Text("${_getDiffOfNextHoliday()}",
            style: GoogleFonts.sunflower(
                textStyle: TextStyle(letterSpacing: 4, fontSize: 120, shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Theme.of(context).shadowColor,
              ),
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 8.0,
                color: Theme.of(context).shadowColor,
              ),
            ]))),
      ],
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

  int _getDiffOfNextHoliday() {
    return consecutiveHolidays.dateList[0].datetime.difference(DateTime.now().getNowDate()).inDays;
  }
}
