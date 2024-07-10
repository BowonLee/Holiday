import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:holiday/layout/yearly/yealy_info_view.dart';

import 'package:holiday/model/holiday/holiday.dart';

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
