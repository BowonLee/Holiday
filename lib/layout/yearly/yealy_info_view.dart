import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:logger/logger.dart';

import '../../bloc/holiday_bloc/holiday_bloc.dart';
import '../../bloc/holiday_bloc/holiday_state.dart';

class YearlyInfoView extends StatefulWidget {
  const YearlyInfoView({super.key});

  @override
  State<YearlyInfoView> createState() => _YearlyInfoViewState();
}

class _YearlyInfoViewState extends State<YearlyInfoView> {
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    final holidayState = context.read<HolidayBloc>().state;

    if (holidayState is! HolidayBlocLoaded) {
      return const Center(
        child: Text("오류 발생"),
      );
    }

    final dividedList = holidayState.holidayList.divideByYear();

    Logger().i(dividedList[currentYear]?.divideByMonth());

    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...holidayState.holidayList.divideByYear().keys.map((e) => TextButton(
                  onPressed: () {
                    setState(() {
                      currentYear = e;
                    });
                  },
                  child: Text(e.toString())))
            ],
          ),
          Container(
            child: Column(
              children: [
                Text("$currentYear"),
                Text("${DateTime.now()}"),
                Text("총 휴일 수 ${dividedList[currentYear]?.length}"),
                Text("주말 제외 휴일 수 ${dividedList[currentYear]?.toWithoutWeekend().length}"),
                Text("남은 휴일 수 ${dividedList[currentYear]?.toWithoutWeekend().toRemainingList().length}"),
                ...?dividedList[currentYear]
                    ?.divideByMonth()
                    .keys
                    .map((e) => Text("$e ${dividedList[currentYear]?.divideByMonth()[e]?.length}"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
