import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../model/consecutive_holidays.dart';

class ConsecutiveHolidaysCardComponent extends StatelessWidget {
  const ConsecutiveHolidaysCardComponent(
      {super.key,
      this.isPast,
      required this.consecutiveHolidays,
      required this.highLight,
      required this.onTapItem});

  final ConsecutiveHolidays consecutiveHolidays;
  final bool highLight;
  final VoidCallback onTapItem;
  final bool? isPast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Card(
        elevation: highLight ? 8 : 0,
        child: Column(
          children: [
            Container(
              color: (isPast ?? false) ? Colors.grey.withOpacity(0.2) : null,
              child: ListTile(
                textColor: (isPast ?? false) ? CupertinoColors.inactiveGray : null,
                title: Text(consecutiveHolidays.title),
                subtitle: (consecutiveHolidays.dateList.length > 1)
                    ? Text(
                        "${DateFormat("M/d(E)").format(consecutiveHolidays.dateList.first.datetime)} ~ ${DateFormat("M/d(E)").format(consecutiveHolidays.dateList.last.datetime)}")
                    : Text(
                        DateFormat("M/d(E)").format(consecutiveHolidays.dateList.first.datetime)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsecutiveHolidayTileField extends StatelessWidget {
  const ConsecutiveHolidayTileField({super.key, required this.consecutiveHolidays});

  final ConsecutiveHolidays consecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          consecutiveHolidays.title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          consecutiveHolidays.dateList.length.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(
          " 일",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ],
    );
  }
}
