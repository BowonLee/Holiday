import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/layout/calander/calandar_consecutive_holidays.dart';
import 'package:holiday/layout/calander/calandar_view.dart';
import 'package:holiday/layout/component/consecutive_holidays_list.dart';
import 'package:holiday/layout/holiday_info/component/upcoming_consecutive_holidays.dart';
import 'package:holiday/layout/yearly/yealy_info_view.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:logger/logger.dart';

import '../../../bloc/holiday_bloc/holiday_state.dart';
import '../../../home_screen_widget/widget_controller.dart';
import '../../holiday_info/holiday_info_layout.dart';
import '../../user_vacation/user_vacation.dart';

class HomeView extends StatefulWidget {
  final List<Holiday> holidayList;

  HomeView({super.key, required this.holidayList});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentView(widget.holidayList),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomSheetTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "info"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.beach_access), label: "내 휴가")
        ],
      ),
    );
    // return Column(
    //   children: [_DateStateField(), HomeMenuField()],
    // );
  }

  _currentView(List<Holiday> holidayList) {
    final viewList = [
      YearlyInfoView(),
      HolidayInfoLayout(
        holidayList: holidayList,
      ),
      UserVacation()
    ];
    return viewList[_selectedIndex];
  }

  _onBottomSheetTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeMainView extends StatefulWidget {
  const HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  int cursor = 0;

  @override
  Widget build(BuildContext context) {
    final List<Holiday> holidayList = (context.read<HolidayBloc>().state as HolidayBlocLoaded).holidayList;

    final List<ConsecutiveHolidays> consecutiveHolidaysList =
        holidayList.toRemainingList().toWithoutWeekend().toEventDateList().toConsecutiveHolidaysList();
    Logger().i(cursor);

    final widgetController = widgetControllerProvider();
    widgetController.updateSingleDueDateWidget(consecutiveHolidaysList.first);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          _DateStateField(
            holidayList: holidayList,
            cursoredConsecutiveHolidays: consecutiveHolidaysList[cursor],
          ),
          MoveDateButtonFiled(
            prev: cursor == 0 ? null : consecutiveHolidaysList[cursor - 1],
            onClickPrevButton: () {
              if (cursor > 0) {
                setState(() {
                  cursor--;
                });
              }
            },
            next: cursor == consecutiveHolidaysList.length - 1 ? null : consecutiveHolidaysList[cursor + 1],
            onClickNextButton: () {
              if (cursor < consecutiveHolidaysList.length - 1) {
                setState(() {
                  cursor++;
                });
              }
            },
          ),
          CalandarConsecutiveHolidays(consecutiveHolidays: consecutiveHolidaysList[cursor]),
          HomeOverviewField()
        ],
      ),
    );
  }
}

/// 휴일 까지 몇일 남았는지 출력
/// 지금 휴일이라면 휴일 안내
/// 휴일 전이라면 D day 표시
class _DateStateField extends StatelessWidget {
  const _DateStateField({super.key, required this.holidayList, required this.cursoredConsecutiveHolidays});

  final List<Holiday> holidayList;
  final ConsecutiveHolidays cursoredConsecutiveHolidays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: cursoredConsecutiveHolidays.state == DateState.now
          ? _CurrentConsecutiveHolidayState(
              consecutiveHolidays: cursoredConsecutiveHolidays,
            )
          : _NextConsecutiveHolidayState(
              consecutiveHolidays: cursoredConsecutiveHolidays,
            ),
    );
  }
}

class _CurrentConsecutiveHolidayState extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _CurrentConsecutiveHolidayState({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("is current")],
    );
  }
}

class _NextConsecutiveHolidayState extends StatelessWidget {
  final ConsecutiveHolidays consecutiveHolidays;

  const _NextConsecutiveHolidayState({super.key, required this.consecutiveHolidays});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [UpComingConsecutiveHolidays(consecutiveHolidays: consecutiveHolidays)],
    );
  }
}

/// 지금 어떤 휴일이며, 언제까지 쉬는지 표시
/// 추가 정보용 페이지
/// 표시할 정보 - 1. 몇일 쉬는지
class HomeOverviewField extends StatelessWidget {
  const HomeOverviewField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }
}

/// 일자를 이동할 수 있는 버튼 영역
/// 처음으로 돌아갈 수 있으며 다음 휴일의 이름도 표시
class MoveDateButtonFiled extends StatefulWidget {
  final ConsecutiveHolidays? prev;
  final ConsecutiveHolidays? next;
  final VoidCallback onClickPrevButton;
  final VoidCallback onClickNextButton;

  const MoveDateButtonFiled(
      {super.key, required this.next, required this.onClickNextButton, this.prev, required this.onClickPrevButton});

  @override
  State<MoveDateButtonFiled> createState() => _MoveDateButtonFiledState();
}

class _MoveDateButtonFiledState extends State<MoveDateButtonFiled> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: widget.prev == null ? null : widget.onClickPrevButton,
                child: const Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                    ),
                    Text(
                      "Prev",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            Text(widget.prev == null ? "" : widget.prev!.title)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: widget.next == null ? null : widget.onClickNextButton,
                child: const Row(
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  ],
                )),
            Text(widget.next == null ? "" : widget.next!.title)
          ],
        ),
      ],
    );
  }
}
