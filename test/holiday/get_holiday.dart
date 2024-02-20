import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_event.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_state.dart';
import 'package:holiday/bloc/holiday_cubit/holiday_cubit.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../app_init/update_time.mocks.dart';

@GenerateMocks([HolidayRepository])
void main() {
  final mockHolidayRepository = MockHolidayRepository();

  /// 2024 5.5 12:30:30
  final DateTime mockPivotUpdateTime = DateTime(2024, 5, 5, 12, 30, 30);
  final DateTime mockPastUpdateTime = DateTime(2024, 5, 4, 12, 30, 30);
  final DateTime mockFutureUpdateTime = DateTime(2024, 5, 6, 12, 30, 30);

  final List<Holiday> mockServerHolidayList = [
    Holiday(date: DateTime(2024, 01, 20), dateName: "설날", dateKind: "공휴일", isHoliday: true),
  ];
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

  group("getAndUpdateListFromServer", () {
    group("response_ok", () {
      setUp(() {
        when(mockHolidayRepository.getListFromSever()).thenAnswer((realInvocation) =>
            Future.value(HolidayResponse(holidayList: mockServerHolidayList, lastUpdateTime: mockPivotUpdateTime)));
        when(mockHolidayRepository.setList(mockServerHolidayList)).thenAnswer((realInvocation) => null);
        when(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime)).thenAnswer((realInvocation) => null);
      });

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is equal",
        act: (bloc) => bloc.add(UpdateHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => Future.value(mockPivotUpdateTime));
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verifyNever(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime));
          verifyNever(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is future",
        act: (bloc) => bloc.add(UpdateHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => Future.value(mockFutureUpdateTime));
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verifyNever(mockHolidayRepository.setLastUpdateDate(mockFutureUpdateTime));
          verifyNever(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is past",
        act: (bloc) => bloc.add(UpdateHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => Future.value(mockPastUpdateTime));
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verify(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime));
          verify(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );
    });
  });

  group("response_fail", () {
    setUp(() {
      when(mockHolidayRepository.getListFromSever()).thenThrow(Exception());
    });

    blocTest(
      "error in client",
      build: () {
        return generateHolidayBloc();
      },
      verify: (bloc) {
        verifyNever(mockHolidayRepository.getLastUpdateDatetime());
        verifyNever(mockHolidayRepository.getListFromDatabase());
        verifyNever(mockHolidayRepository.getListFromAsset());
        verifyNever(mockHolidayRepository.getListFromAsset());
        verifyNever(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime));
        verifyNever(mockHolidayRepository.setList(mockServerHolidayList));
      },
    );
  });

  group("getDataFromList", () {
    group("database_enable", () {
      blocTest(
        "database_list",
        build: () {
          when(mockHolidayRepository.getListFromDatabase()).thenAnswer((realInvocation) => mockDatabaseHolidayList);
          return generateHolidayBloc();
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>().having((state) => state.holidayList, "fromDatabase", mockDatabaseHolidayList)
        ],
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromDatabase());
          verifyNever(mockHolidayRepository.getListFromAsset());
        },
      );

      blocTest(
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

      blocTest(
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

    group("database_disable", () {});
  });
}
