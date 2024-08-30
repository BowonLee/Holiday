import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../client/holiday_client.dart';
import '../database/hive_helper.dart';
import '../model/holiday/holiday.dart';

HolidayRepository holidayRepositoryProvider() {
  final client = GetIt.instance.get<HolidayClient>();
  HolidayRepository holidayRepository = HolidayRepository(client: client);
  return holidayRepository;
}

class HolidayRepository {
  HolidayClient client;

  HolidayRepository({required this.client});

  setList(List<Holiday> holidayList) {
    return HiveHelper().setHolidayList(holidayList);
  }

  setLastUpdateDate(DateTime updateDatetime) {
    return HiveHelper().setLastHolidayUpdateDatetime(updateDatetime);
  }

  DateTime? getLastUpdateDatetime() {
    return HiveHelper().getLastHolidayUpdateDatetime();
  }

  Future<HolidayResponse> getListFromSever() async {
    final holidayList = await client.getHolidayList();

    return holidayList;
  }

  List<Holiday>? getListFromDatabase() {
    final holidayList = HiveHelper().getHolidayList();

    return holidayList;
  }

  Future<List<Holiday>> getListFromAsset() async {
    final asset = await rootBundle.loadString('assets/json/holidays.json');
    final List<dynamic> decodedList = jsonDecode(asset);

    final holidayList = decodedList.map((e) => Holiday.fromJson(e));

    return holidayList.toList();
  }
}
