import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_state.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:logger/logger.dart';

import '../bloc/holiday_event.dart';
import '../client/rest_client.dart';
import '../repository/holiday_repository.dart';
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
    RestClient _client = RestClient(dio);

    return BlocProvider(
      create: (_) =>
          HolidayBloc(repository: HolidayRepository(client: _client)),
      child: const MaterialApp(home: _HomePage()),
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
      appBar: AppBar(
        title: const Text("올해의 쉬는 날"),
      ),
      body: BlocBuilder<HolidayBloc, HolidayState>(
        builder: (_, state) {
          // Logger().i(state);
          if (state is Error) {
            // error
            state.message;
            return CustomErrorWidget(
              message: state.message,
            );
          } else if (state is Loading) {
            // loading indicator
            return const CircularProgressIndicator();
          } else if (state is Empty) {
            // empty container
            return const Text("정보 없음");
          } else if (state is Loaded) {
            return _HomeBody(holidayList: state.holidayList);
          }

          return Container();
        },
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  List<Holiday> holidayList;
  late Map<int, List<Holiday>> _holidayListMapByYear;
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
      Logger().i(year);
    });
  }

  List<Holiday> _getCurrentList() {
    return widget._holidayListMapByYear[widget._currentYear] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateTime.now().toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget._holidayListMapByYear.keys
              .map<Widget>((year) => TextButton(
                  onPressed: () => {_onClickYearButton(year)},
                  child: Text(year.toString())))
              .toList(),
        ),
        _InfoContainer(
                year: widget._currentYear, holidayList: _getCurrentList())
            .build(),
        Expanded(
            child: ListView.separated(
          itemBuilder: (_, index) => Text("${_getCurrentList()[index]}"),
          separatorBuilder: (_, index) => const Divider(
            height: 1,
            color: Colors.black,
          ),
          itemCount: _getCurrentList().length,
        ))
      ],
    );
  }
}

class _InfoContainer {
  List<Holiday> holidayList;
  int year;
  _InfoContainer({required this.year, required this.holidayList});

  Widget build() {
    // Logger().i(displayInfo.year);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Center(
            child: Text("$year 의 휴일입니다."),
          ),
          Row(
            children: [
              const Text("총 휴일 수 : "),
              Text(holidayList.length.toString())
            ],
          ),
          Row(
            children: [
              const Text("주말을 제외한 휴일 수 : "),
              Text(holidayList.toWithoutWeekend().length.toString())
            ],
          ),
          Row(
            children: [
              const Text("남은 휴일 수 : "),
              Text(holidayList
                  .toWithoutWeekend()
                  .toRemainingList()
                  .length
                  .toString())
            ],
          )
        ],
      ),
    );
  }
}
