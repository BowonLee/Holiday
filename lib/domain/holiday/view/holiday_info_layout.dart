import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holiday/domain/holiday/model/consecutive_holidays_extention.dart';
import 'package:holiday/domain/holiday/model/event_date_extension.dart';
import 'package:holiday/domain/holiday/model/holiday_extention.dart';

import 'package:holiday/domain/holiday/view/consecutive_holidays_period.dart';

import 'package:intl/intl.dart';

import '../../../core/util/datetime_extentions.dart';
import '../model/consecutive_holidays.dart';
import '../model/event_date.dart';
import '../model/holiday.dart';
import 'component/animate_prograss_bar_component.dart';

import 'component/remaing_timer_component.dart';
import 'consecutive_holidays_title.dart';

part './part/move_holiday_buttons.dart';

part './part/current_consecutive_holidays.dart';

part './part/days_until_holiday.dart';

part './part/information_field.dart';

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
    consecutiveHolidayList =
        widget.holidayList.toWithoutWeekend().toEventDateList().toConsecutiveHolidaysList();
    indexCursor = consecutiveHolidayList.getUpcomingIndex();
  }

  @override
  Widget build(BuildContext context) {
    /// 가장 근접한 연휴 정보
    final current = consecutiveHolidayList[indexCursor];
    final prev = indexCursor > 0 ? consecutiveHolidayList[indexCursor - 1] : null;
    final next = indexCursor < consecutiveHolidayList.length - 1
        ? consecutiveHolidayList[indexCursor + 1]
        : null;

    widget.holidayList.divideByYear();

    /**
     * 1안. 분할 시점에 몇번째인지 확인할 수 있는 정보를 저장
     * 2안. 분할 후 확인.
     *
     * 연도별 분할 후 2가지의 리스트를 같이 이동하는 방식으로 조정할 경우 UI 코드가 다소 복잡해질 수 있음
     * 고유값이 없는 상황이기에, 연휴의 고유값과 휴일의 고유값은 다를 수 있으며 합산되는 경우 단순 비교로 구분할 수 없다.
     *
     *
     */
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${DateFormat("yyyy M/d(E)").format(DateTime.now())}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          current.state == DateState.now
              ? CurrentConsecutiveHolidaysComponent(consecutiveHolidays: current)
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
          Text("총 ${current.dateList.length} 일 동안 쉽니다"),
          Text("${current.dateList.first.datetime.year}년 ${indexCursor + 1}번째 연휴"),
          Text(
              "그 다음 연휴(${next?.title})까지 ${next?.dateList.first.datetime.difference(current.dateList.last.datetime).inDays}일"),
        ],
      ),
    );
  }
}
