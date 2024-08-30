import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../holiday/model/holiday.dart';
import '../../holiday/view/holiday_info_layout.dart';
import '../../vacation/bloc/user_vacation.dart';
import '../../yearly/yealy_info_view.dart';
import '../component/action_button.dart';
import '../component/expandable_fab.dart';

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
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
