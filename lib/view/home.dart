import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/model/display_info/display_info.dart';
import 'package:logger/logger.dart';

import '../client/rest_client.dart';
import '../model/holiday/holiday.dart';

/// 홈 화면 구성
/// 1. 오늘 Datetime
/// 2. 가장 가까운 휴일
/// 3. 올해 남은 휴일 / 총 휴일
/// 4.
class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DisplayInfo _nextYear = DisplayInfo(
      year: 1234, totalCount: 0, remainingCount: 0, closeHoliday: []);
  DisplayInfo _currentYear = DisplayInfo(
      year: 1234, totalCount: 0, remainingCount: 0, closeHoliday: []);

  DisplayInfo _currentState = DisplayInfo(
      year: 1234, totalCount: 0, remainingCount: 0, closeHoliday: []);

  Future<DisplayInfo> getHoliday() async {
    final dio = Dio();

    final client = RestClient(dio);
    final logger = Logger();
    List<Holiday> result = await client.getHolidayList();

    List<DisplayInfo> displayInfo = result.toDisplayInfo();
    DisplayInfo currentYear = displayInfo[0];
    DisplayInfo nextYear = displayInfo[1];

    logger.i(nextYear.toString());

    logger.i(currentYear.toString());

    setState(() {
      _currentYear = currentYear;
      _nextYear = nextYear;
      _currentState = currentYear;
    });

    return nextYear;
  }

  void _changeState(YEAR_STATE year) {
    setState(() {
      if (year == YEAR_STATE.CURRENT) {
        _currentState = _currentYear;
      } else {
        _currentState = _nextYear;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getHoliday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("쉬는 날"),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                TextButton(
                    onPressed: () => _changeState(YEAR_STATE.CURRENT),
                    child: Text("${_currentYear.year}")),
                TextButton(
                    onPressed: () => _changeState(YEAR_STATE.NEXT),
                    child: Text("${_nextYear.year}")),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("올해 총 휴일은 ? "),
                Text("${_currentState.totalCount}")
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("올해 남은 휴일은 ? "),
                Text("${_currentState.remainingCount}")
              ],
            ),
          ),
          ..._currentState.closeHoliday.map((e) => Row(
                children: [Text(e.date), Text(e.dateName), Text(e.dateKind)],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )),
        ],
      ),
    );
  }
}

enum YEAR_STATE { CURRENT, NEXT }
