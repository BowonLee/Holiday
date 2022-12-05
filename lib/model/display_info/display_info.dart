import 'package:freezed_annotation/freezed_annotation.dart';

import '../holiday/holiday.dart';

part 'display_info.freezed.dart';

@freezed
class DisplayInfo with _$DisplayInfo {
  factory DisplayInfo(
      {required String year,
      required int totalCount,
      required int remaining,
      required List<Holiday> closeHoliday}) = _DisplayInfo;
}
