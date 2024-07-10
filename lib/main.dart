import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:holiday/bloc/app_init/app_init_bloc.dart';
import 'package:holiday/client/holiday_client.dart';
import 'package:holiday/layout/app_init/app_init_builder.dart';
import 'package:holiday/repository/holiday_repository.dart';

import 'package:holiday/repository/metadata_repository.dart';
import 'package:holiday/theme_cubit/theme_cubit.dart';
import 'package:intl/intl.dart';

import 'client/dio_service.dart';
import 'client/metadata_client.dart';
import 'database/hive_helper.dart';
import 'firebase_options.dart';
import 'layout/home/view/home_builder.dart';

void main() async {
  await preInit();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (_) => ThemeCubit(),
      ),
      BlocProvider(
        create: (_) => AppInitBloc(
            metadataRepository: metadataRepositoryProvider(), holidayRepository: holidayRepositoryProvider()),
      )
    ],
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
            theme: state.currentThemeModel.themeLightData,
            darkTheme: state.currentThemeModel.themeDarkData,
            home: const AppInitBuilder(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate
            ],
            supportedLocales: [
              Locale('en', ''), // English, no country code
              Locale('ko', ''),
            ]);
      },
    ),
  ));
}

Future<void> preInit() async {
  /**
   * init 셋팅
   * 정보 업데이트해야 하는지 확인
   */

  // Intl.defaultLocale = 'ko_KR';
  setupDio();
  setUpHolidayClient();
  setUpMetaClient();
  Intl.defaultLocale = 'ko_KR';
  // await initializeDateFormatting('ko_KR', null);
  await HiveHelper().initHiveManager();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
