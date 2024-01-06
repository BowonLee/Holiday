import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../client/holiday_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';

HolidayRepository holidayRepositoryProvider() {
  final client = GetIt.instance.get<RestClient>();
  HolidayRepository holidayRepository = HolidayRepository(client: client);
  return holidayRepository;
}

class HolidayRepository {
  RestClient client;

  HolidayRepository({required this.client});

  Future setHolidayList() async {}

  Future<List<Holiday>> getHolidayList() async {
    List<Holiday> fromHive = await HiveHelper().readAll();

    if (fromHive.isEmpty) {
      Logger().i("from server");

      try {
        HolidayResponse _fromServer = await client.getHolidayList();

        Logger().i(_fromServer);
        final holidayList = _fromServer.holidayList;
        HiveHelper().saveAll(holidayList);
        return holidayList;
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
