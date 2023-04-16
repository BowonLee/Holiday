import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_datetime.freezed.dart';

part 'update_datetime.g.dart';

class AppMetadata {
  final List<UpdateDateTime> lastUpdateTimeList;

  AppMetadata({required this.lastUpdateTimeList});
}

@freezed
class UpdateDateTime with _$UpdateDateTime {
  const factory UpdateDateTime({required String typeName, required DateTime updateDateTime}) = _UpdateDateTime;

  factory UpdateDateTime.fromJson(Map<String, dynamic> json) => _$UpdateDateTimeFromJson(json);
}
