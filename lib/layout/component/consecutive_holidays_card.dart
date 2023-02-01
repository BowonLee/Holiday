import 'package:flutter/material.dart';
import 'package:holiday/util/datetime_extentions.dart';

import '../../model/consecutive_holidays/consecutive_holidays.dart';
import '../../model/event_date/event_date.dart';

class ConsecutiveHolidaysCardComponent extends StatelessWidget {
  const ConsecutiveHolidaysCardComponent(
      {Key? key, required this.consecutiveHolidays, required this.highLight})
      : super(key: key);

  final ConsecutiveHolidays consecutiveHolidays;
  final bool highLight;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).shadowColor,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.modulate),
                image: NetworkImage(
                    "https://t1.daumcdn.net/cfile/tistory/9990A1485E4E39752A?original"))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    consecutiveHolidays.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      consecutiveHolidays.dateList.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(" 일동안 쉴 수 있습니다.")
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }

  Widget buildDateItem(EventDate eventDate) => Container(
          // decoration: BoxDecoration(border: Border.all()),
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
