import 'package:flutter_test/flutter_test.dart';
import 'package:holiday/bloc/app_init/app_init_bloc.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:holiday/repository/metadata_repository.dart';
import 'package:mockito/annotations.dart';

import 'update_time.mocks.dart';

@GenerateMocks([
  MetadataRepository,
  HolidayRepository,
])
void main() {
  final mockMetadataRepository = MockMetadataRepository();
  final mockHolidayRepository = MockHolidayRepository();
  final AppInitBloc appInitBloc =
      AppInitBloc(metadataRepository: mockMetadataRepository, holidayRepository: mockHolidayRepository);

  group("connection_ok", () {
    setUp(() {});
    test("local_datetime_empty", () => null);
    test("local_datetime_before", () => null);
    test("local_datetime_equal", () => null);
    test("local_datetime_after", () => null);
  });

  group("connection_error", () {
    test("local_datetime_empty", () => null);
    test("local_datetime_before", () => null);
    test("local_datetime_equal", () => null);
    test("local_datetime_after", () => null);
  });
}
