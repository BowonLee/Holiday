import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holiday/layout/component/animate/animate_prograss_bar.dart';
import 'package:holiday/layout/holiday_info/component/consecutive_holidays_period.dart';

import 'package:holiday/model/consecutive_holidays/consecutive_holidays_extention.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../model/consecutive_holidays/consecutive_holidays.dart';
import '../../model/event_date/event_date.dart';
import '../../model/holiday/holiday.dart';
import 'component/consecutive_holidays_title.dart';

part 'part/move_holiday_buttons.dart';

part 'part/current_consecutive_holidays.dart';

part 'part/days_until_holiday.dart';

part 'part/information_field.dart';

class HolidayInfoLayout extends StatefulWidget {
  final List<Holiday> holidayList;

  const HolidayInfoLayout({
    super.key,
    required this.holidayList,
  });

  @override
  State<HolidayInfoLayout> createState() => _HolidayInfoLayoutState();
}

class _HolidayInfoLayoutState extends State<HolidayInfoLayout> {
  int indexCursor = 0;
  List<ConsecutiveHolidays> consecutiveHolidayList = [];

  @override
  void initState() {
    super.initState();
    consecutiveHolidayList = widget.holidayList.toEventDateList().toConsecutiveHolidaysList();
    indexCursor = consecutiveHolidayList.getUpcomingIndex();
  }

  @override
  Widget build(BuildContext context) {
    /// 가장 근접한 연휴 정보
    final current = consecutiveHolidayList[indexCursor];
    final prev = indexCursor > 0 ? consecutiveHolidayList[indexCursor - 1] : null;
    final next = indexCursor < consecutiveHolidayList.length - 1 ? consecutiveHolidayList[indexCursor + 1] : null;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 70,
            ),
            current.state == DateState.now
                ? CurrentConsecutiveHolidays(consecutiveHolidays: current)
                : DaysUntilHoliday(consecutiveHolidays: current),
            const SizedBox(
              height: 30,
            ),
            MoveDateButtonFiled(
              next: next,
              prev: prev,
              onClickNextButton: () {
                setState(() {
                  indexCursor++;
                });
              },
              onClickPrevButton: () {
                setState(() {
                  indexCursor--;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            _InformationField(
              consecutiveHolidays: current,
            ),
            Text("총 ${current.dateList.length} 일 연휴"),
            Text("${current.dateList.first.datetime.year}년 ${indexCursor}번째 연휴"),
            Text("다음 연휴까지 ${next?.dateList.first.datetime.difference(current.dateList.last.datetime).inDays}일"),
          ],
        ),
      ),
    );
  }
}
