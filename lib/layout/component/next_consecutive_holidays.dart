import 'package:flutter/material.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';

class NextConsecutiveHolidays extends StatelessWidget {
  const NextConsecutiveHolidays({Key? key, required this.consecutiveHolidays})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 25;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${consecutiveHolidays.title}까지 ",
                style: TextStyle(
                  fontSize: defaultFontSize,
                ),
              ),
              Text("${_getDiffOfNextHoliday()}일",
                  style: TextStyle(
                      fontSize: defaultFontSize + 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
              Text(" 남았습니다.",
                  style: TextStyle(
                    fontSize: defaultFontSize,
                  ))
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // ConsecutiveHolidaysCardComponent(consecutiveHolidays: consecutiveHolidays,
          //     highLight: true)
        ],
      ),
    );
  }

  _getDiffOfNextHoliday() {
    return consecutiveHolidays.dateList[0].datetime
        .difference(DateTime.now())
        .inDays;
  }
}
