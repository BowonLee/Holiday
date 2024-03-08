import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/layout/component/consecutive_holidays_list.dart';
import 'package:holiday/layout/component/next_consecutive_holidays.dart';
import 'package:holiday/layout/yearly/yealy_info_view.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/util/datetime_extentions.dart';
import 'package:logger/logger.dart';

import '../../../bloc/holiday_bloc/holiday_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _currentView(),
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

  _currentView() {
    const viewList = [YearlyInfoView(), HomeMainView(), Text("2")];
    return viewList[_selectedIndex];
  }

  _onBottomSheetTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeMainView extends StatelessWidget {
  const HomeMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final HolidayBlocLoaded loadedState = context.read<HolidayBloc>().state as HolidayBlocLoaded;

    final remaining =
        loadedState.holidayList.toWithoutWeekend().toRemainingList().toEventDateList().toConsecutiveHolidaysList();

    Logger().i(remaining);
    return Column(
      children: [
        _DateStateField(),
        Expanded(
          child: ConsecutiveHolidaysListComponent(
            consecutiveHolidaysList: remaining,
          ),
        )
      ],
    );
  }
}

/// 휴일 까지 몇일 남았는지 출력
/// 지금 휴일이라면 휴일 안내
/// 휴일 전이라면 D day 표시
class _DateStateField extends StatelessWidget {
  const _DateStateField({super.key});

  @override
  Widget build(BuildContext context) {
    final HolidayBlocLoaded loadedState = context.read<HolidayBloc>().state as HolidayBlocLoaded;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: _homeMainScreenByDateState(loadedState.holidayList),
    );
  }

  Widget _homeMainScreenByDateState(List<Holiday> holidayList) {
    final next = holidayList.toWithoutWeekend().toRemainingList().toEventDateList().toConsecutiveHolidaysList().first;

    final current = holidayList
        .toWithoutWeekend()
        .toEventDateList()
        .toConsecutiveHolidaysList()
        .where((element) => element.state == DateState.now);

    if (current.isEmpty) {
      return _NextConsecutiveHolidayState(
        consecutiveHolidays: next,
      );
    } else {
      return _CurrentConsecutiveHolidayState(
        consecutiveHolidays: current.first,
      );
    }
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
      children: [NextConsecutiveHolidays(consecutiveHolidays: consecutiveHolidays)],
    );
  }
}

/// 지금 어떤 휴일이며, 언제가지 쉬는지 표시

/// 추가 페이지
class HomeMenuField extends StatelessWidget {
  const HomeMenuField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
