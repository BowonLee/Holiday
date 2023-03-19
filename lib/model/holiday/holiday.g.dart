// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HolidayAdapter extends TypeAdapter<_$_Holiday> {
  @override
  final int typeId = 1;

  @override
  _$_Holiday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Holiday(
      date: fields[0] as DateTime,
      dateName: fields[1] as String,
      dateKind: fields[2] as String,
      isHoliday: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Holiday obj) {
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

_$_Holiday _$$_HolidayFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['date'],
  );
  return _$_Holiday(
    date: DateTime.parse(json['date'] as String),
    dateName: json['dateName'] as String,
    dateKind: json['dateKind'] as String,
    isHoliday: json['isHoliday'] as bool,
  );
}

Map<String, dynamic> _$$_HolidayToJson(_$_Holiday instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'dateName': instance.dateName,
      'dateKind': instance.dateKind,
      'isHoliday': instance.isHoliday,
    };
