import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_event.dart';

import 'package:holiday/bloc/holiday_bloc/holiday_state.dart';

import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../holiday/get_from_local.mocks.dart';

@GenerateMocks([HolidayRepository])
void main() {
  final mockHolidayRepository = MockHolidayRepository();

  final List<Holiday> mockDatabaseHolidayList = [
    Holiday(date: DateTime(2024, 01, 20), dateName: "설날", dateKind: "공휴일", isHoliday: true),
  ];
  final List<Holiday> mockAssetHolidayList = [
    Holiday(date: DateTime(2024, 01, 20), dateName: "설날", dateKind: "공휴일", isHoliday: true),
  ];
  final List<Holiday> mockEmptyList = [];

  HolidayBloc generateHolidayBloc() {
    return HolidayBloc(holidayRepository: mockHolidayRepository);
  }

  group("getDataFromList", () {
    group("databaseEnable", () {
      blocTest<HolidayBloc, HolidayBlocState>(
        "database_list",
        build: () {
          when(mockHolidayRepository.getListFromDatabase()).thenAnswer((realInvocation) => mockDatabaseHolidayList);
          return generateHolidayBloc();
        },
        act: (bloc) => bloc.add(GetHolidayFromLocalEvent()),
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "fromDatabase", mockDatabaseHolidayList)
        ],
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromDatabase());
          verifyNever(mockHolidayRepository.getListFromAsset());
        },
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "database_null",
        build: () {
          when(mockHolidayRepository.getListFromDatabase()).thenAnswer((realInvocation) => null);
          return generateHolidayBloc();
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "fromAsset", mockAssetHolidayList)
        ],
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromDatabase());
          verify(mockHolidayRepository.getListFromAsset());
        },
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "database_empty",
        build: () {
          when(mockHolidayRepository.getListFromDatabase()).thenAnswer((realInvocation) => mockEmptyList);
          return generateHolidayBloc();
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "fromAsset", mockAssetHolidayList)
        ],
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromDatabase());
          verify(mockHolidayRepository.getListFromAsset());
        },
      );
    });

    group("databaseDisable", () {});
  });
}
