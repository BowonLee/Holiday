import 'package:flutter/material.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date.dart';
import 'package:holiday/util/datetime_extentions.dart';

class ConsecutiveHolidaysListComponent extends StatelessWidget {
  const ConsecutiveHolidaysListComponent(
      {Key? key, required this.consecutiveHolidaysList})
      : super(key: key);

  final List<ConsecutiveHolidays> consecutiveHolidaysList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (_, index) => ConsecutiveHolidaysListItemComponent(
              consecutiveHolidays: consecutiveHolidaysList[index]),
          separatorBuilder: (_, index) => const Divider(
                height: 1,
                color: Colors.black,
              ),
          itemCount: consecutiveHolidaysList.length),
    );
  }
}

class ConsecutiveHolidaysListItemComponent extends StatelessWidget {
  const ConsecutiveHolidaysListItemComponent(
      {Key? key, required this.consecutiveHolidays})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(consecutiveHolidays.title),
                Text("${consecutiveHolidays.dateList.length} 일동안 쉴 수 있습니다.")
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: consecutiveHolidays.dateList
                    .map<Widget>((eventDate) => buildDateItem(eventDate))
                    .toList(),
              ),
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateItem(EventDate eventDate) => Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("${eventDate.datetime.month}/ "
                "${eventDate.datetime.day} "
                "(${eventDate.datetime.getWeekendString()})"),
            Text(eventDate.name)
          ],
        ),
      ));
}
