part of '../holiday_info_layout.dart';

class DaysUntilHoliday extends StatelessWidget {
  const DaysUntilHoliday({super.key, required this.consecutiveHolidays});

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConsecutiveHolidaysTitle(consecutiveHolidays: consecutiveHolidays),
        ConsecutiveHolidaysPeriod(consecutiveHolidays: consecutiveHolidays),
        Text("${_getDiffOfNextHoliday()}",
            style: GoogleFonts.sunflower(
                textStyle: TextStyle(letterSpacing: 4, fontSize: 100, shadows: <Shadow>[
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

  int _getDiffOfNextHoliday() {
    return consecutiveHolidays.dateList[0].datetime.difference(DateTime.now().getNowDate()).inDays;
  }
}
