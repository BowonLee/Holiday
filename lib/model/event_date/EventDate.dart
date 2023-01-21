import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holiday/util/datetime_extentions.dart';

part 'EventDate.freezed.dart';

@freezed
class EventDate with _$EventDate {
  factory EventDate(
      {required DateTime datetime,
      required String name,
      @Default(DateState.none) DateState state}) = _EventDate;

  EventDate._();
}
