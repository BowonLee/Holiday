import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/layout/yearly/yealy_info_view.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _currentView(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomSheetTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home2"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home3")
        ],
      ),
    );
    // return Column(
    //   children: [_DateStateField(), HomeMenuField()],
    // );
  }

  _currentView() {
    const viewList = [Text("data"), YearlyInfoView(), Text("2")];
    return viewList[_selectedIndex];
  }

  _onBottomSheetTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

    final remainingHolidays =
        loadedState.holidayList.toWithoutWeekend().toRemainingList().toEventDateList().toConsecutiveHolidaysList();

    final nextHoliday =
        loadedState.holidayList.toWithoutWeekend().toRemainingList().toEventDateList().toConsecutiveHolidaysList();
    Logger().i(nextHoliday.first);

    return Text(
        "${nextHoliday.first.title} D - ${nextHoliday.first.dateList.first.datetime.difference(DateTime.now()).inDays} ");
  }
}

class _NextHoliday extends StatelessWidget {
  const _NextHoliday({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
