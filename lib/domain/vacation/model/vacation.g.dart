// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VacationAdapter extends TypeAdapter<_$VacationImpl> {
  @override
  final int typeId = 1;

  @override
  _$VacationImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VacationImpl(
      date: fields[0] as DateTime,
      dateName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$VacationImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VacationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacationImpl _$$VacationImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['date'],
  );
  return _$VacationImpl(
    date: DateTime.parse(json['date'] as String),
    dateName: json['dateName'] as String,
  );
}

Map<String, dynamic> _$$VacationImplToJson(_$VacationImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'dateName': instance.dateName,
    };
