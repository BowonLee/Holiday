import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:holiday/client/test_client.dart';
import 'package:holiday/layout/component/consecutive_holidays_list.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays_extention.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../bloc/holiday_bloc/holiday_bloc.dart';
import '../../bloc/holiday_bloc/holiday_state.dart';
import '../calander/custom_calandar.dart';

part 'part/yearly_buttons.dart';

class YearlyInfoView extends StatefulWidget {
  const YearlyInfoView({super.key});

  @override
  State<YearlyInfoView> createState() => _YearlyInfoViewState();
}

class _YearlyInfoViewState extends State<YearlyInfoView> {
  int currentYear = DateTime.now().year;
  final ScrollController _listScrollController = ScrollController();
  DateTime focusDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    test();
  }

  test() async {
    final client = GetIt.instance.get<TestClient>();
    final temp = await client.getTest();
    print(temp);
    Logger().e(temp);
  }

  @override
  Widget build(BuildContext context) {
    final holidayState = context.read<HolidayBloc>().state;

    if (holidayState is! HolidayBlocLoaded) {
      return const Center(
        child: Text("오류 발생"),
      );
    }

    final holidayList = holidayState.holidayList;
    final holidayMapByYear = holidayList.divideByYear();
    final consecutiveHolidaysByCurrentYear =
        holidayMapByYear[currentYear]!.toEventDateList().toConsecutiveHolidaysList();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(consecutiveHolidaysByCurrentYear.getUpcomingIndex());
    });

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
                if (currentYear == DateTime.now().year) {
                  focusDate = DateTime.now();
                } else {
                  focusDate = DateTime(currentYear, 1, 1);
                }
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
                Text("총 휴일 수 ${holidayMapByYear[currentYear]?.length}"),
                Text("주말 제외 휴일 수 ${holidayMapByYear[currentYear]?.toWithoutWeekend().length}"),
                Text(
                    "남은 휴일 수 ${holidayMapByYear[currentYear]?.toWithoutWeekend().toRemainingList().length}"),
              ],
            ),
          ),
          CustomCalandar(
            startYear: currentYear,
            endYear: currentYear,
            onClickEventDateItem: (datetime) {
              _scrollToIndex(consecutiveHolidaysByCurrentYear.findIndexByDatetime(datetime));
            },
            onClickTodayButton: () {
              setState(() {
                currentYear = DateTime.now().year;
                focusDate = DateTime.now();
              });
            },
            focusDate: focusDate,
            eventDateList: consecutiveHolidaysByCurrentYear.toEventDateList(),
          ),
          Expanded(
            // height: 30,
            child: ConsecutiveHolidaysListComponent(
                onTapItem: (item) {
                  setState(() {
                    if (holidayMapByYear.keys.first > item.dateList.first.datetime.year) {
                      focusDate = item.dateList.last.datetime;
                    } else {
                      focusDate = item.dateList.first.datetime;
                    }
                  });
                },
                scrollController: _listScrollController,
                consecutiveHolidaysList:
                    holidayMapByYear[currentYear]!.toEventDateList().toConsecutiveHolidaysList()),
          ),
        ],
      ),
    );
  }

  void _scrollToIndex(int index) {
    final position = _listScrollController.position.minScrollExtent + (index * 80.0);
    _listScrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
