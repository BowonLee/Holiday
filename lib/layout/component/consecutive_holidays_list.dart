import 'package:flutter/material.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';

import 'consecutive_holidays_card.dart';

class ConsecutiveHolidaysListComponent extends StatelessWidget {
  const ConsecutiveHolidaysListComponent(
      {Key? key, required this.consecutiveHolidaysList})
      : super(key: key);

  final List<ConsecutiveHolidays> consecutiveHolidaysList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) {
          if (index == consecutiveHolidaysList.length) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            );
          }
          return ConsecutiveHolidaysCardComponent(
            consecutiveHolidays: consecutiveHolidaysList[index],
            highLight: false,
          );
        },
        itemCount: consecutiveHolidaysList.length + 1);
  }
}
