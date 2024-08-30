import 'package:flutter/material.dart';
import 'package:holiday/domain/holiday/model/holiday_extention.dart';

import '../model/holiday.dart';

class HolidayInfoComponent extends StatelessWidget {
  final List<Holiday> holidayList;
  final int year;

  const HolidayInfoComponent({Key? key, required this.holidayList, required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle contentTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Container(
        // decoration: buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text("$year",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "총 휴일 수 : ",
                    style: contentTextStyle,
                  ),
                  Text(
                    holidayList.length.toString(),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "주말을 제외한 휴일 수 : ",
                    style: contentTextStyle,
                  ),
                  Text(holidayList.toWithoutWeekend().length.toString())
                ],
              ),
              Row(
                children: [
                  Text(
                    "남은 휴일 수 : ",
                    style: contentTextStyle,
                  ),
                  Text(holidayList.toWithoutWeekend().toRemainingList().length.toString())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// 표시할 정보
/// 총 휴일 수
/// 남은 휴일 수
