// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_datetime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateDateTime _$UpdateDateTimeFromJson(Map<String, dynamic> json) {
  return _UpdateDateTime.fromJson(json);
}

/// @nodoc
mixin _$UpdateDateTime {
  String get typeName => throw _privateConstructorUsedError;
  DateTime get updateDatetime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateDateTimeCopyWith<UpdateDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDateTimeCopyWith<$Res> {
  factory $UpdateDateTimeCopyWith(
          UpdateDateTime value, $Res Function(UpdateDateTime) then) =
      _$UpdateDateTimeCopyWithImpl<$Res, UpdateDateTime>;
  @useResult
  $Res call({String typeName, DateTime updateDatetime});
}

/// @nodoc
class _$UpdateDateTimeCopyWithImpl<$Res, $Val extends UpdateDateTime>
    implements $UpdateDateTimeCopyWith<$Res> {
  _$UpdateDateTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
    Object? updateDatetime = null,
  }) {
    return _then(_value.copyWith(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDatetime: null == updateDatetime
          ? _value.updateDatetime
          : updateDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateDateTimeCopyWith<$Res>
    implements $UpdateDateTimeCopyWith<$Res> {
  factory _$$_UpdateDateTimeCopyWith(
          _$_UpdateDateTime value, $Res Function(_$_UpdateDateTime) then) =
      __$$_UpdateDateTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String typeName, DateTime updateDatetime});
}

/// @nodoc
class __$$_UpdateDateTimeCopyWithImpl<$Res>
    extends _$UpdateDateTimeCopyWithImpl<$Res, _$_UpdateDateTime>
    implements _$$_UpdateDateTimeCopyWith<$Res> {
  __$$_UpdateDateTimeCopyWithImpl(
      _$_UpdateDateTime _value, $Res Function(_$_UpdateDateTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
    Object? updateDatetime = null,
  }) {
    return _then(_$_UpdateDateTime(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDatetime: null == updateDatetime
          ? _value.updateDatetime
          : updateDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateDateTime implements _UpdateDateTime {
  const _$_UpdateDateTime(
      {required this.typeName, required this.updateDatetime});

  factory _$_UpdateDateTime.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateDateTimeFromJson(json);

  @override
  final String typeName;
  @override
  final DateTime updateDatetime;

  @override
  String toString() {
    return 'UpdateDateTime(typeName: $typeName, updateDatetime: $updateDatetime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDateTime &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.updateDatetime, updateDatetime) ||
                other.updateDatetime == updateDatetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, typeName, updateDatetime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDateTimeCopyWith<_$_UpdateDateTime> get copyWith =>
      __$$_UpdateDateTimeCopyWithImpl<_$_UpdateDateTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateDateTimeToJson(
      this,
    );
  }
}

abstract class _UpdateDateTime implements UpdateDateTime {
  const factory _UpdateDateTime(
      {required final String typeName,
      required final DateTime updateDatetime}) = _$_UpdateDateTime;

  factory _UpdateDateTime.fromJson(Map<String, dynamic> json) =
      _$_UpdateDateTime.fromJson;

  @override
  String get typeName;
  @override
  DateTime get updateDatetime;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateDateTimeCopyWith<_$_UpdateDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}
