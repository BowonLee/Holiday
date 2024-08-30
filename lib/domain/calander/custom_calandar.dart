import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/core/util/datetime_extentions.dart';

import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/util/custom_callback.dart';
import '../holiday/model/event_date.dart';

class CustomCalandar extends StatelessWidget {
  final List<EventDate> eventDateList;
  final int startYear;
  final int endYear;
  final DateTime? focusDate;
  final VoidCallback? onClickTodayButton;
  final DatetimeCallback? onClickEventDateItem;

  const CustomCalandar(
      {super.key,
      required this.eventDateList,
      required this.startYear,
      required this.endYear,
      this.focusDate,
      this.onClickTodayButton,
      this.onClickEventDateItem});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      locale: "ko_KR",
      focusedDay:
          focusDate ?? ((DateTime.now().year >= startYear) ? DateTime.now() : DateTime(endYear)),
      firstDay: DateTime.utc(startYear, 1, 1),
      lastDay: DateTime.utc(endYear, 12, 31),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${DateFormat("yyyy년 M월").format(day)}"),
              TextButton(onPressed: onClickTodayButton, child: Text("today"))
            ],
          );
        },
        defaultBuilder: (context, day, focusedDay) {
          if (_isEventDate(day)) {
            return _EventDateItem(
              dateTime: day,
              onClickItem: onClickEventDateItem,
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

  _isEventDate(DateTime date) {
    return eventDateList.indexWhere((element) => element.datetime.isSameDate(date)) != -1;
  }
}

class _EventDateItem extends StatelessWidget {
  final DateTime dateTime;
  final DatetimeCallback? onClickItem;

  const _EventDateItem({super.key, required this.dateTime, this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClickItem != null) {
          onClickItem!(dateTime);
        }
      },
      child: Center(
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
                "${dateTime.day}",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
