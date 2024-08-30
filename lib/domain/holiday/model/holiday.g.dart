// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HolidayAdapter extends TypeAdapter<_$HolidayImpl> {
  @override
  final int typeId = 1;

  @override
  _$HolidayImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HolidayImpl(
      date: fields[0] as DateTime,
      dateName: fields[1] as String,
      dateKind: fields[2] as String,
      isHoliday: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$HolidayImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateName)
      ..writeByte(2)
      ..write(obj.dateKind)
      ..writeByte(3)
      ..write(obj.isHoliday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HolidayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HolidayResponseImpl _$$HolidayResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HolidayResponseImpl(
      holidayList: (json['holidayList'] as List<dynamic>)
          .map((e) => Holiday.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdateTime: DateTime.parse(json['lastUpdateTime'] as String),
    );

Map<String, dynamic> _$$HolidayResponseImplToJson(
        _$HolidayResponseImpl instance) =>
    <String, dynamic>{
      'holidayList': instance.holidayList,
      'lastUpdateTime': instance.lastUpdateTime.toIso8601String(),
    };

_$HolidayImpl _$$HolidayImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['date'],
  );
  return _$HolidayImpl(
    date: DateTime.parse(json['date'] as String),
    dateName: json['dateName'] as String,
    dateKind: json['dateKind'] as String,
    isHoliday: json['isHoliday'] as bool,
  );
}

Map<String, dynamic> _$$HolidayImplToJson(_$HolidayImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'dateName': instance.dateName,
      'dateKind': instance.dateKind,
      'isHoliday': instance.isHoliday,
    };
