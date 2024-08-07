import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/model/event_date/event_date.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class CalandarView extends StatelessWidget {
  final List<EventDate> eventDateList;
  final int startYear;
  final int endYear;
  final DateTime? focusDate;

  const CalandarView(
      {super.key,
      required this.eventDateList,
      required this.startYear,
      required this.endYear,
      this.focusDate});

  @override
  Widget build(BuildContext context) {
    Logger().i(Localizations.localeOf(context).languageCode);
    return TableCalendar(
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      locale: "ko_KR",
      focusedDay: (DateTime.now().year >= startYear) ? DateTime.now() : DateTime(endYear),
      firstDay: DateTime.utc(startYear, 1, 1),
      lastDay: DateTime.utc(endYear, 12, 31),
      calendarBuilders: CalendarBuilders(
        // dowBuilder: (context, day) {
        //   if (day.isWeekend()) {
        //     return Center(
        //       child: Text(
        //         DateFormat('EEE').format(day),
        //         style: const TextStyle(color: Colors.red),
        //       ),
        //     );
        //   }
        //   return null;
        // },
        headerTitleBuilder: (context, day) {
          // 월 이동시
          Logger().i(day);
        },
        defaultBuilder: (context, day, focusedDay) {
          if (eventDateList.indexWhere((element) => element.datetime.isSameDate(day)) != -1) {
            Logger().i("${day} ??");
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
}
