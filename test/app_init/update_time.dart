import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/domain/init/bloc/app_init_bloc.dart';
import 'package:holiday/domain/init/model/update_datetime.dart';
import 'package:holiday/domain/holiday/repository/holiday_repository.dart';
import 'package:holiday/domain/init/client/metadata_repository.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

import 'update_time.mocks.dart';

@GenerateMocks([
  MetadataRepository,
  HolidayRepository,
])
void main() {
  final mockMetadataRepository = MockMetadataRepository();
  final mockHolidayRepository = MockHolidayRepository();

  /// 2024 5.5 12:30:30
  final DateTime mockPivotUpdateTime = DateTime(2024, 5, 5, 12, 30, 30);
  final DateTime mockPastUpdateTime = DateTime(2024, 5, 4, 12, 30, 30);
  final DateTime mockFutureUpdateTime = DateTime(2024, 5, 6, 12, 30, 30);

  AppInitBloc generateAppInitBloc() {
    return AppInitBloc(
        metadataRepository: mockMetadataRepository, holidayRepository: mockHolidayRepository);
  }

  group("connection_ok", () {
    final List<UpdateDateTime> mockResponse = [
      UpdateDateTime(typeName: "HOLIDAY", updateDateTime: mockPivotUpdateTime)
    ];

    setUp(() {
      when(mockMetadataRepository.getMetaDataListFromServer())
          .thenAnswer((realInvocation) => Future.value(mockResponse));
    });

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_empty',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime()).thenAnswer((realInvocation) => null);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocComplete>()
            .having((state) => state.needUpdateHolidayList, "needUpdate", true),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_before',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockPastUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocComplete>()
            .having((state) => state.needUpdateHolidayList, "needUpdate", true),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_equal',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockPivotUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocComplete>()
            .having((state) => state.needUpdateHolidayList, "notNeedUpdate", false),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_after',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockFutureUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocComplete>()
            .having((state) => state.needUpdateHolidayList, "notNeedUpdate", false),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_error',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime()).thenThrow(Exception());
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );
  });

  group("connection_error", () {
    setUp(() {
      when(mockMetadataRepository.getMetaDataListFromServer()).thenThrow(Exception());
    });

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_empty',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime()).thenAnswer((realInvocation) => null);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_before',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockPastUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_equal',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockPivotUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_after',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime())
            .thenAnswer((realInvocation) => mockFutureUpdateTime);
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );

    blocTest<AppInitBloc, AppInitBlocState>(
      'local_datetime_error',
      build: () {
        when(mockHolidayRepository.getLastUpdateDatetime()).thenThrow(Exception());
        return generateAppInitBloc();
      },
      act: (bloc) => bloc.add(GetMetaDataEvent()),
      expect: () => [
        isA<AppInitBlocLoading>(),
        isA<AppInitBlocError>(),
      ],
    );
  });
}
