import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_state.dart';
import 'package:holiday/layout/component/next_consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';

import '../bloc/holiday_event.dart';
import '../client/rest_client.dart';
import '../repository/holiday_repository.dart';
import '../theme/red_wine.dart';
import 'component/consecutive_holidays_interval_card/consecutive_holidays_interval_card.dart';
import 'component/consecutive_holidays_list.dart';
import 'component/holiday_info_component.dart';
import 'custom_error_widget.dart';

/// 홈 화면 구성
/// 1. 오늘 Datetime
/// 2. 가장 가까운 휴일
/// 3. 올해 남은 휴일 / 총 휴일
/// 4.
class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    dio.options = BaseOptions(connectTimeout: 100);

    RestClient _client = RestClient(dio);

    return MaterialApp(
      theme: midNightThemeLight,
      darkTheme: midNightThemeDark,
      home: BlocProvider(
          create: (_) => HolidayBloc(
                repository: HolidayRepository(client: _client),
              ),
          child: const _HomePage()),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HolidayBloc>(context)
        .add(ListHolidayEvent(holidayList: []));
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      body: BlocBuilder<HolidayBloc, GetHolidayState>(
        builder: (_, state) {
          // Logger().i(state);
          if (state is GetHolidayError) {
            // error
            state.message;
            return CustomErrorWidget(
              message: state.message,
            );
          } else if (state is GetHolidayLoading) {
            // loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (state is HolidayEmpty) {
            // empty container
            return _EmptyWidget();
          } else if (state is GetHolidayLoaded) {
            return _HomeBody(holidayList: state.holidayList);
          }

          return Container();
        },
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("정보 없음");
  }
}

class _HomeBody extends StatefulWidget {
  final List<Holiday> holidayList;
  late final Map<int, List<Holiday>> _holidayListMapByYear;
  late int _currentYear;

  _HomeBody({Key? key, required this.holidayList}) : super(key: key) {
    _holidayListMapByYear = holidayList.divideByYear();
    _currentYear = _holidayListMapByYear.keys.first;
  }

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  _onClickYearButton(int year) {
    setState(() {
      widget._currentYear = year;
    });
  }

  List<Holiday> _getCurrentList() =>
      widget._holidayListMapByYear[widget._currentYear] ?? [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/holiday.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              Text(
                "${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              ConsecutiveHolidaysIntervalCard.fromConsecutiveHolidays(
                  last: widget.holidayList
                      .toWithoutWeekend()
                      .toEventDateList()
                      .toConsecutiveHolidaysList()[0],
                  next: widget.holidayList
                      .toWithoutWeekend()
                      .toRemainingList()
                      .toEventDateList()
                      .toConsecutiveHolidaysList()[0]),
              NextConsecutiveHolidays(
                  consecutiveHolidays: widget.holidayList
                      .toWithoutWeekend()
                      .toRemainingList()
                      .toEventDateList()
                      .toConsecutiveHolidaysList()[0]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget._holidayListMapByYear.keys
                    .map<Widget>((year) => TextButton(
                          onPressed: () => {_onClickYearButton(year)},
                          child: Text(
                            year.toString(),
                            style: TextStyle(
                                fontWeight: widget._currentYear == year
                                    ? FontWeight.w900
                                    : FontWeight.w500,
                                fontSize:
                                    widget._currentYear == year ? 30 : 20),
                          ),
                        ))
                    .toList(),
              ),
              HolidayInfoComponent(
                  year: widget._currentYear, holidayList: _getCurrentList()),
              Expanded(
                child: ConsecutiveHolidaysListComponent(
                    consecutiveHolidaysList: widget.holidayList
                        .toWithoutWeekend()
                        .toEventDateList()
                        .toConsecutiveHolidaysList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
