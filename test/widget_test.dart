// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/client/rest_client.dart';
import 'package:holiday/database/hive_helper.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:logger/logger.dart';

final logger = Logger();

Future main() async {
  HiveHelper.initHiveManager();
  Dio dio = Dio();
  HiveHelper helper = HiveHelper();
  RestClient client = RestClient(dio);
  HolidayRepository repository =
      HolidayRepository(hiveHelper: helper, client: client);
  test("repo", () async {
    var data = await repository.getHolidayList();

    logger.i("data");
  });

  // Tests here
}
