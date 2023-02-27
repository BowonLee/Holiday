import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../client/rest_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';

class HolidayRepository {
  RestClient client;

  HolidayRepository({required this.client});

  Future setHolidayList() async {}

  Future<List<Holiday>> getHolidayList() async {
    List<Holiday> fromHive = await HiveHelper().readAll();

    if (fromHive.isEmpty) {
      Logger().i("from server");

      try {
        List<Holiday> _fromServer = await client.getHolidayList();

        HiveHelper().saveAll(_fromServer);
        return _fromServer;
      } on Exception catch (_, exception) {

        Logger().e(exception);
        final json = await _parseJsonFromAsset();

        return json.map<Holiday>((item) => Holiday.fromJson(item)).toList();
      }
    } else {
      Logger().i("from db");
      return fromHive;
    }
  }

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString('assets/json/holidays.json');
  }

  Future<List<dynamic>> _parseJsonFromAsset() async {
    String jsonString = await _loadFromAsset();
    return json.decode(jsonString);
  }
}
