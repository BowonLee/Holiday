import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holiday/layout/view/home_page.dart';
import 'package:holiday/theme/flex_theme.dart';

import 'database/hive_helper.dart';
import 'firebase_options.dart';

void main() async {
  await preInit();

  runApp(MaterialApp(
      theme: midNightThemeLight,
      darkTheme: midNightThemeDark,
      home: const HomePage()));
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
