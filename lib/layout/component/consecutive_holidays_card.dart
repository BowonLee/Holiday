import 'package:flutter/material.dart';
import 'package:holiday/util/datetime_extentions.dart';

import '../../model/consecutive_holidays/consecutive_holidays.dart';
import '../../model/event_date/event_date.dart';

class ConsecutiveHolidaysCardComponent extends StatelessWidget {
  const ConsecutiveHolidaysCardComponent({Key? key, required this.consecutiveHolidays, required this.highLight})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;
  final bool highLight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Theme.of(context).cardColor.withOpacity(consecutiveHolidays.state == DateState.before ? 0 : 0.7),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (consecutiveHolidays.state == DateState.before) const Text("지나간 휴일입니다."),
              Row(
                children: [
                  Text(
                    consecutiveHolidays.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    consecutiveHolidays.dateList.length.toString(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  Text(
                    " 일동안 쉴 수 있습니다.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: consecutiveHolidays.dateList
                      .map<Widget>((eventDate) => buildDateItem(context, eventDate))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateItem(BuildContext context, EventDate eventDate) {
    final isNow = eventDate.state == DateState.now;

    BoxDecoration decoration = BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
    );

    return Container(
        decoration: isNow ? decoration : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${eventDate.datetime.month}. "
                "${eventDate.datetime.day} "
                "(${eventDate.datetime.getWeekendString()})",
                style: TextStyle(fontSize: 20),
              ),
              Text(eventDate.name, style: TextStyle(fontSize: 20))
            ],
          ),
        ));
  }
}
