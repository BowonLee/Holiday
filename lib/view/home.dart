import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/model/display_info/display_info.dart';

import '../client/rest_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';
import '../repository/holiday_repository.dart';

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
    Dio dio = Dio();
    HiveHelper helper = HiveHelper();
    RestClient client = RestClient(dio);
    HolidayRepository repository = HolidayRepository(client: client);

    List<Holiday> result = await repository.getHolidayList();

    List<DisplayInfo> displayInfo = result.toDisplayInfo();
    DisplayInfo currentYear = displayInfo[0];
    DisplayInfo nextYear = displayInfo[1];

    setState(() {
      _currentYear = currentYear;
      _nextYear = nextYear;
      _currentState = currentYear;
    });

    return nextYear;
  }

  void _changeState(YearState year) {
    setState(() {
      if (year == YearState.current) {
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
                    onPressed: () => _changeState(YearState.current),
                    child: Text("${_currentYear.year}")),
                TextButton(
                    onPressed: () => _changeState(YearState.next),
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
          ..._currentState.closeHoliday.map((item) => Row(
                children: [
                  Text(item.date),
                  Text(item.dateName),
                  Text(item.dateKind)
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )),
        ],
      ),
    );
  }
}

enum YearState { current, next }
