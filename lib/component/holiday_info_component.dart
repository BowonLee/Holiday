import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';

class HolidayInfoComponent extends StatelessWidget {
  final List<Holiday> holidayList;
  const HolidayInfoComponent({Key? key, required this.holidayList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
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
            ),
            Row(
              children: [
                const Text("다음 휴일까지 "),
                Text(_getNextDateDiff().inDays.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Duration _getNextDateDiff() {
    return DateTime.parse(
            holidayList.toWithoutWeekend().toRemainingList()[0].date)
        .difference(DateTime.now());
  }
}

///
/// 표시할 정보
/// 총 휴일 수
/// 남은 휴일 수
