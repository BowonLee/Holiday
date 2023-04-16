// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_datetime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateDateTime _$$_UpdateDateTimeFromJson(Map<String, dynamic> json) =>
    _$_UpdateDateTime(
      typeName: json['typeName'] as String,
      updateDateTime: DateTime.parse(json['updateDateTime'] as String),
    );

Map<String, dynamic> _$$_UpdateDateTimeToJson(_$_UpdateDateTime instance) =>
    <String, dynamic>{
      'typeName': instance.typeName,
      'updateDateTime': instance.updateDateTime.toIso8601String(),
    };
