import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../util/datetime_extentions.dart';
import '../event_date/event_date.dart';

part 'vacation.freezed.dart';

part 'vacation.g.dart';

@freezed
abstract class Vacation with _$Vacation {
  @HiveType(typeId: 1, adapterName: "VacationAdapter")
  const factory Vacation({
    @JsonKey(name: "date", required: true) @HiveField(0) required DateTime date,
    @HiveField(1) required String dateName,
  }) = _Vacation;

  factory Vacation.fromJson(Map<String, dynamic> json) => _$VacationFromJson(json);
}
