import 'package:flutter/material.dart';
import 'package:holiday/database/hive_helper.dart';
import 'package:holiday/view/home.dart';

void main() async {
  await preInit();
  runApp(const HomeWidget());
}

Future<void> preInit() async {
  /**
   * init 셋팅
   * 정보 업데이트해야하는지 확인
   *
   */
  await HiveHelper.initHiveManager();
}
