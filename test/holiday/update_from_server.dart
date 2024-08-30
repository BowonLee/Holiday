import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_event.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_state.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../holiday/update_from_server.mocks.dart';

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

  HolidayBloc generateHolidayBloc() {
    return HolidayBloc(holidayRepository: mockHolidayRepository);
  }

  group("getAndUpdateListFromServer", () {
    group("response_ok", () {
      setUp(() {
        when(mockHolidayRepository.getListFromSever()).thenAnswer((realInvocation) => Future.value(
            HolidayResponse(
                holidayList: mockServerHolidayList, lastUpdateTime: mockPivotUpdateTime)));
        when(mockHolidayRepository.setList(mockServerHolidayList))
            .thenAnswer((realInvocation) => null);
        when(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime))
            .thenAnswer((realInvocation) => null);
      });

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is equal",
        act: (bloc) => bloc.add(UpdateAndGetHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => mockPivotUpdateTime);
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verifyNever(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime));
          verifyNever(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>()
              .having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is future",
        act: (bloc) => bloc.add(UpdateAndGetHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => mockFutureUpdateTime);
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verifyNever(mockHolidayRepository.setLastUpdateDate(mockFutureUpdateTime));
          verifyNever(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>()
              .having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );

      blocTest<HolidayBloc, HolidayBlocState>(
        "local is past",
        act: (bloc) => bloc.add(UpdateAndGetHolidayEvent()),
        build: () {
          when(mockHolidayRepository.getLastUpdateDatetime())
              .thenAnswer((realInvocation) => mockPastUpdateTime);
          return generateHolidayBloc();
        },
        verify: (bloc) {
          verify(mockHolidayRepository.getListFromSever());
          verify(mockHolidayRepository.setLastUpdateDate(mockPivotUpdateTime));
          verify(mockHolidayRepository.setList(mockServerHolidayList));
        },
        expect: () => [
          isA<HolidayBlocLoading>(),
          isA<HolidayBlocLoaded>()
              .having((state) => state.holidayList, "description", mockServerHolidayList)
        ],
      );
    });

    group("response_fail", () {
      setUp(() {
        when(mockHolidayRepository.getListFromSever()).thenThrow(Exception());
      });

      blocTest<HolidayBloc, HolidayBlocState>(
        "error in client",
        act: (bloc) => bloc.add(UpdateAndGetHolidayEvent()),
        build: () {
          return generateHolidayBloc();
        },
        verify: (bloc) {},
        expect: () => [isA<HolidayBlocLoading>(), isA<HolidayBlocError>()],
      );
    });
  });
}
