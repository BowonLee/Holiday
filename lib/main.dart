import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'database/hive_helper.dart';
import 'firebase_options.dart';
import 'layout/home.dart';

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
  await HiveHelper().initHiveManager();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


}
