part of '../holiday_info_layout.dart';

class CurrentConsecutiveHolidays extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const CurrentConsecutiveHolidays({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...consecutiveHolidays.dateList.map(
              (e) => _EventDateComponent(eventDate: e),
            ),
          ],
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
    if (eventDate.state == DateState.now) {}
    return Text(" ${DateFormat("M/d(E)").format(eventDate.datetime)} ");
  }
}
