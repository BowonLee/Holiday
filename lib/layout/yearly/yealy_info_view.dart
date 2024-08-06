import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/layout/component/consecutive_holidays_list.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../bloc/holiday_bloc/holiday_bloc.dart';
import '../../bloc/holiday_bloc/holiday_state.dart';
import '../calander/calandar_view.dart';

part 'part/yearly_buttons.dart';

class YearlyInfoView extends StatefulWidget {
  const YearlyInfoView({super.key});

  @override
  State<YearlyInfoView> createState() => _YearlyInfoViewState();
}

class _YearlyInfoViewState extends State<YearlyInfoView> {
  int currentYear = DateTime.now().year;
  final ScrollController _listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final holidayState = context.read<HolidayBloc>().state;

    if (holidayState is! HolidayBlocLoaded) {
      return const Center(
        child: Text("오류 발생"),
      );
    }

    final dividedList = holidayState.holidayList.divideByYear();

    Future.delayed(
      Duration(milliseconds: 300),
      () {
        _scrollToIndex(4);
      },
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _YearlyButtons(
            holidayList: holidayState.holidayList,
            currentYear: currentYear,
            yearButtonCallback: (year) {
              setState(() {
                currentYear = year;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${DateFormat("yyyy M/d(E)").format(DateTime.now())}",
                ),
                Text("총 휴일 수 ${dividedList[currentYear]?.length}"),
                Text("주말 제외 휴일 수 ${dividedList[currentYear]?.toWithoutWeekend().length}"),
                Text(
                    "남은 휴일 수 ${dividedList[currentYear]?.toWithoutWeekend().toRemainingList().length}"),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: CalandarView(
                startYear: currentYear,
                endYear: currentYear,
                eventDateList: dividedList[currentYear]!.toEventDateList(),
              )),
          Expanded(
            // height: 30,
            child: ConsecutiveHolidaysListComponent(
                onTapItem: (item) {
                  Logger().i(item);
                },
                scrollController: _listScrollController,
                consecutiveHolidaysList:
                    dividedList[currentYear]!.toEventDateList().toConsecutiveHolidaysList()),
          ),
        ],
      ),
    );
  }

  /**
   * 특정 월을 기준으로 가장 가까움 아이템을 찾아주는 항목이 필요하다.
   * 달력을 해당 연휴의 시작점이 있는 월로 이동시키는 항목이 필요하다.
   */
  void _scrollToIndex(int index) {
    final position = _listScrollController.position.minScrollExtent +
        (index * 80.0); // Assuming each item has a height of 50.0
    _listScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
}
