// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_datetime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateDateTimeImpl _$$UpdateDateTimeImplFromJson(Map<String, dynamic> json) =>
    _$UpdateDateTimeImpl(
      typeName: json['typeName'] as String,
      updateDateTime: DateTime.parse(json['updateDateTime'] as String),
    );

Map<String, dynamic> _$$UpdateDateTimeImplToJson(
        _$UpdateDateTimeImpl instance) =>
    <String, dynamic>{
      'typeName': instance.typeName,
      'updateDateTime': instance.updateDateTime.toIso8601String(),
    };
