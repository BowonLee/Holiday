// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/client/rest_client.dart';
import 'package:holiday/model/holiday/holiday.dart';
// import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

//
final logger = Logger();

void main() {
  // logger.i("message");

  test('Counter increments smoke test', () async {
    final dio = Dio();

    final client = RestClient(dio);

    final result = await client.getHolidayList();

    // var display = DisplayInfo().fromHolidayList(year, origin)

    List<Holiday> withoutWeekend = result.where((element) {
      int weekday = DateTime.parse(element.date).weekday;
      return weekday != 6 && weekday != 7;
    }).toList();

    List<Holiday> remaining = withoutWeekend
        .where(
            (element) => DateTime.parse(element.date).isAfter(DateTime.now()))
        .toList();

    // final temp = remaining.fromHolidayList(year, origin)
    logger.i(remaining);
  });
}
