import 'package:flutter/material.dart';
import 'package:holiday/layout/component/consecutive_holidays_card.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';

class NextConsecutiveHolidays extends StatelessWidget {
  const NextConsecutiveHolidays({Key? key, required this.consecutiveHolidays})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("다음 휴일까지"),
        SizedBox(
          height: 10,
        ),
        ConsecutiveHolidaysCardComponent(
            consecutiveHolidays: consecutiveHolidays, highLight: true)
      ],
    );
  }

  _getDiffOfNextHoliday() {}
}
