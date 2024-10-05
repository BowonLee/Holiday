import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:holiday/domain/holiday/repository/holiday_hive.dart';
import 'package:logger/logger.dart';

import 'holiday_client.dart';
import '../../../core/repository/hive/hive_helper.dart';

import '../model/holiday.dart';

HolidayRepository holidayRepositoryProvider() {
  final client = GetIt.instance.get<HolidayClient>();
  final hiveService = GetIt.instance.get<HolidayHiveService>();

  HolidayRepository holidayRepository =
      HolidayRepository(client: client, holidayHiveService: hiveService);
  return holidayRepository;
}

class HolidayRepository {
  HolidayClient client;
  HolidayHiveService holidayHiveService;

  HolidayRepository({required this.client, required this.holidayHiveService});

  setList(List<Holiday> holidayList) {
    return holidayHiveService.setList(holidayList);
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
    final holidayList = holidayHiveService.getList();

    return holidayList;
  }

  Future<List<Holiday>> getListFromAsset() async {
    final asset = await rootBundle.loadString('assets/json/holidays.json');
    final List<dynamic> decodedList = jsonDecode(asset);

    final holidayList = decodedList.map((e) => Holiday.fromJson(e));

    return holidayList.toList();
  }
}
