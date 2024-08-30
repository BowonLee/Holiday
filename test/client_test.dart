// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/client/holiday_client.dart';
import 'package:holiday/domain/holiday/model/holiday.dart';

// import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

//
final logger = Logger();

void main() {
  // logger.i("message");

  test('Counter increments smoke test', () async {
    final dio = Dio();

    final client = HolidayClient(dio);

    final result = await client.getHolidayList();

    // var display = DisplayInfo().fromHolidayList(year, origin)

    List<Holiday> withoutWeekend = result.holidayList.where((element) {
      int weekday = element.date.weekday;
      return weekday != 6 && weekday != 7;
    }).toList();

    List<Holiday> remaining =
        withoutWeekend.where((element) => element.date.isAfter(DateTime.now())).toList();

    // final temp = remaining.fromHolidayList(year, origin)
    logger.i(remaining);
  });
}
