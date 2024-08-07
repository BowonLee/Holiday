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
        RemainingTimer(targetDateTime: consecutiveHolidays.dateList.last.datetime),
        const SizedBox(
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

  Text buildRemainingText(EventDate eventDate) {
    /// 시간을 일 / 시 / 분 / 초로 분리
    Duration difference = eventDate.datetime.difference(DateTime.now());
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    String timeStr = "$days일 $hours시간 $minutes분 $seconds초";
    return Text(timeStr);
  }
}
