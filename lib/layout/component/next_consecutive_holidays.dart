import 'package:flutter/material.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/util/datetime_extentions.dart';

class NextConsecutiveHolidays extends StatelessWidget {
  const NextConsecutiveHolidays({Key? key, required this.consecutiveHolidays}) : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    double defaultFontSize = 20;
    return Column(
      children: [
        Text.rich(TextSpan(
          style: TextStyle(
            fontSize: defaultFontSize,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: "${consecutiveHolidays.title}까지 ",
            ),
            WidgetSpan(
              child: Text("${_getDiffOfNextHoliday()}일",
                  style: TextStyle(
                      fontSize: defaultFontSize, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
              alignment: PlaceholderAlignment.middle,
            ),
          ],
        )),
        // SizedBox(
        //   height: 10,
        // ),
        // ConsecutiveHolidaysCardComponent(consecutiveHolidays: consecutiveHolidays,
        //     highLight: true)
      ],
    );
  }

  _getDiffOfNextHoliday() {
    return consecutiveHolidays.dateList[0].datetime.difference(DateTime.now().getNowDate()).inDays;
  }
}
