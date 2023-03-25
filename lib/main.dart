import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/client/rest_client.dart';
import 'package:holiday/layout/view/home_page.dart';
import 'package:holiday/theme_cubit/theme_cubit.dart';
import 'package:logger/logger.dart';

import 'client/dio_service.dart';
import 'database/hive_helper.dart';
import 'firebase_options.dart';

void main() async {
  await preInit();

  runApp(BlocProvider(
    create: (_) => ThemeCubit(),
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
            theme: state.currentThemeModel.themeLightData,
            darkTheme: state.currentThemeModel.themeDarkData,
            home: const HomePage());
      },
    ),
  ));
}

Future<void> preInit() async {
  /**
   * init 셋팅
   * 정보 업데이트해야 하는지 확인
   */

  setupDio();
  setUpClient();

  await HiveHelper().initHiveManager();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
