part of '../holiday_info_layout.dart';

class CurrentConsecutiveHolidays extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const CurrentConsecutiveHolidays({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ConsecutiveHolidaysTitle(consecutiveHolidays: consecutiveHolidays),
        ConsecutiveHolidaysPeriod(consecutiveHolidays: consecutiveHolidays),
        SizedBox(
          height: 20,
        ),
        ConsecutiveHolidaysIntervalCard(
          lastDate: consecutiveHolidays.dateList.first.datetime,
          lastHolidaysName: consecutiveHolidays.dateList.first.name,
          nextDate: consecutiveHolidays.dateList.last.datetime,
          nextHolidaysName: consecutiveHolidays.dateList.last.name,
        ),
      ],
    );
  }
}

class _EventDateComponent extends StatelessWidget {
  final EventDate eventDate;

  _EventDateComponent({super.key, required this.eventDate});

  @override
  Widget build(BuildContext context) {
    if (eventDate.state == DateState.now) {
      Logger().i(eventDate);
    }
    return Text(" ${DateFormat("M/d(E)").format(eventDate.datetime)} ");
  }
}
