import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_state.dart';
import 'package:holiday/model/display_info/display_info.dart';
import 'package:holiday/view/custom_error_widget.dart';

import '../bloc/holiday_event.dart';
import '../client/rest_client.dart';
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
            return _HomeBody(
                displayInfoList: state.holidayList.toDisplayInfo());
          }

          return Container();
        },
      ),
    );
  }
}

// Scaffold body widget
// now date
// change year buttons
// infoContainer
// listContainer

class _HomeBody extends StatelessWidget {
  List<DisplayInfo> displayInfoList;
  _HomeBody({Key? key, required this.displayInfoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateTime.now().toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: displayInfoList
              .map<Widget>((e) => TextButton(
                  onPressed: () => {}, child: Text(e.year.toString())))
              .toList(),
        ),
      ],
    );
  }
}

enum YearState { current, next }
