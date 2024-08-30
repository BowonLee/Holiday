import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/core/util/datetime_extentions.dart';

import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

import '../holiday/model/consecutive_holidays.dart';

class CalandarConsecutiveHolidays extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const CalandarConsecutiveHolidays({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    final firstDay = getFirstDateOfTheWeek(consecutiveHolidays.dateList.first.datetime);
    final lastDay = getLastDateOfTheWeek(consecutiveHolidays.dateList.last.datetime);

    ///
    /// lastDay를 기준으로 오늘이 2주 안쪽이라면 전주를 기준으로 표기한다.
    ///
    ///
    Logger().i(Localizations.localeOf(context).languageCode);
    return TableCalendar(
      locale: "ko_KR",
      calendarFormat: CalendarFormat.twoWeeks,
      headerStyle: const HeaderStyle(
          formatButtonVisible: false, leftChevronVisible: false, rightChevronVisible: false),
      focusedDay: consecutiveHolidays.dateList.first.datetime,
      firstDay: firstDay,
      lastDay: lastDay,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          if (consecutiveHolidays.dateList
                  .indexWhere((element) => element.datetime.isSameDate(day)) !=
              -1) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    shape: BoxShape.circle,
                    color: Colors.redAccent),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text(
                      "${day.day}",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          } else if (day.isWeekend()) {
            return Center(
              child: Text(
                "${day.day}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return null;
        },
      ),
    );
  }

  DateTime getFirstDateOfTheWeek(DateTime date) {
    int dayOfWeek = date.weekday;
    int difference = dayOfWeek - DateTime.monday + 1;
    DateTime firstDayOfWeek = date.subtract(Duration(days: difference));

    return firstDayOfWeek;
  }

  DateTime getLastDateOfTheWeek(DateTime date) {
    int dayOfWeek = date.weekday;
    int difference = DateTime.sunday - dayOfWeek - 1;
    DateTime lastDayOfWeek = date.add(Duration(days: difference));

    return lastDayOfWeek;
  }
}

/**
 * 연휴 첫날의 앞주가 포함 +
 * 연휴 끝날 주말이 포함
 * 해당일이 해당 월의 몇번째 주인지 알아야 함
 */
