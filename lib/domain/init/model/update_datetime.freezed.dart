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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateDateTime _$UpdateDateTimeFromJson(Map<String, dynamic> json) {
  return _UpdateDateTime.fromJson(json);
}

/// @nodoc
mixin _$UpdateDateTime {
  String get typeName => throw _privateConstructorUsedError;
  DateTime get updateDateTime => throw _privateConstructorUsedError;

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
  $Res call({String typeName, DateTime updateDateTime});
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
    Object? updateDateTime = null,
  }) {
    return _then(_value.copyWith(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDateTime: null == updateDateTime
          ? _value.updateDateTime
          : updateDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateDateTimeImplCopyWith<$Res>
    implements $UpdateDateTimeCopyWith<$Res> {
  factory _$$UpdateDateTimeImplCopyWith(_$UpdateDateTimeImpl value,
          $Res Function(_$UpdateDateTimeImpl) then) =
      __$$UpdateDateTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String typeName, DateTime updateDateTime});
}

/// @nodoc
class __$$UpdateDateTimeImplCopyWithImpl<$Res>
    extends _$UpdateDateTimeCopyWithImpl<$Res, _$UpdateDateTimeImpl>
    implements _$$UpdateDateTimeImplCopyWith<$Res> {
  __$$UpdateDateTimeImplCopyWithImpl(
      _$UpdateDateTimeImpl _value, $Res Function(_$UpdateDateTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeName = null,
    Object? updateDateTime = null,
  }) {
    return _then(_$UpdateDateTimeImpl(
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      updateDateTime: null == updateDateTime
          ? _value.updateDateTime
          : updateDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateDateTimeImpl implements _UpdateDateTime {
  const _$UpdateDateTimeImpl(
      {required this.typeName, required this.updateDateTime});

  factory _$UpdateDateTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateDateTimeImplFromJson(json);

  @override
  final String typeName;
  @override
  final DateTime updateDateTime;

  @override
  String toString() {
    return 'UpdateDateTime(typeName: $typeName, updateDateTime: $updateDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDateTimeImpl &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.updateDateTime, updateDateTime) ||
                other.updateDateTime == updateDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, typeName, updateDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDateTimeImplCopyWith<_$UpdateDateTimeImpl> get copyWith =>
      __$$UpdateDateTimeImplCopyWithImpl<_$UpdateDateTimeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateDateTimeImplToJson(
      this,
    );
  }
}

abstract class _UpdateDateTime implements UpdateDateTime {
  const factory _UpdateDateTime(
      {required final String typeName,
      required final DateTime updateDateTime}) = _$UpdateDateTimeImpl;

  factory _UpdateDateTime.fromJson(Map<String, dynamic> json) =
      _$UpdateDateTimeImpl.fromJson;

  @override
  String get typeName;
  @override
  DateTime get updateDateTime;
  @override
  @JsonKey(ignore: true)
  _$$UpdateDateTimeImplCopyWith<_$UpdateDateTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
