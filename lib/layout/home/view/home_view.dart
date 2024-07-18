import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:holiday/layout/home/component/action_button.dart';
import 'package:holiday/layout/home/component/expandable_fab.dart';

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
      floatingActionButton: ExpandableFab(
        distance: 120,
        children: [
          ActionButton(onPressed: () => _onBottomSheetTapped(1), icon: Icon(Icons.home)),
          ActionButton(onPressed: () => _onBottomSheetTapped(0), icon: Icon(Icons.calendar_today)),
          if (!kIsWeb)
            ActionButton(onPressed: () => _onBottomSheetTapped(2), icon: Icon(Icons.person))
        ],
        initialOpen: true,
      ),
    );
  }

  _currentView(List<Holiday> holidayList) {
    final viewList = [
      YearlyInfoView(),
      HolidayInfoLayout(
        holidayList: holidayList,
      ),
      UserVacation()
    ];
    return SafeArea(child: viewList[_selectedIndex]);
  }

  _onBottomSheetTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
