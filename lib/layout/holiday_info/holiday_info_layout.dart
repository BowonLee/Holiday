import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:holiday/model/consecutive_holidays/consecutive_holidays_extention.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:intl/intl.dart';

import '../../model/consecutive_holidays/consecutive_holidays.dart';
import '../../model/event_date/event_date.dart';
import '../../model/holiday/holiday.dart';

part 'part/move_holiday_buttons.dart';

part 'part/current_consecutive_holidays.dart';

part 'part/days_until_holiday.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          DaysUntilHoliday(consecutiveHolidays: current),
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
          Text("총 ${current.dateList.length} 일 연휴"),
          Text("${current.dateList.first.datetime.year}년 ${indexCursor}번째 연휴"),
          Text("다음 연휴까지 ${next?.dateList.first.datetime.difference(current.dateList.last.datetime).inDays}일"),
        ],
      ),
    );
  }
}
