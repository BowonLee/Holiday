// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventDate {
  DateTime get datetime => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  EventDateType get type => throw _privateConstructorUsedError;
  DateState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDateCopyWith<EventDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDateCopyWith<$Res> {
  factory $EventDateCopyWith(EventDate value, $Res Function(EventDate) then) =
      _$EventDateCopyWithImpl<$Res, EventDate>;
  @useResult
  $Res call(
      {DateTime datetime, String name, EventDateType type, DateState state});
}

/// @nodoc
class _$EventDateCopyWithImpl<$Res, $Val extends EventDate>
    implements $EventDateCopyWith<$Res> {
  _$EventDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? name = null,
    Object? type = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventDateType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DateState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDateImplCopyWith<$Res>
    implements $EventDateCopyWith<$Res> {
  factory _$$EventDateImplCopyWith(
          _$EventDateImpl value, $Res Function(_$EventDateImpl) then) =
      __$$EventDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime datetime, String name, EventDateType type, DateState state});
}

/// @nodoc
class __$$EventDateImplCopyWithImpl<$Res>
    extends _$EventDateCopyWithImpl<$Res, _$EventDateImpl>
    implements _$$EventDateImplCopyWith<$Res> {
  __$$EventDateImplCopyWithImpl(
      _$EventDateImpl _value, $Res Function(_$EventDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? name = null,
    Object? type = null,
    Object? state = null,
  }) {
    return _then(_$EventDateImpl(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventDateType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DateState,
    ));
  }
}

/// @nodoc

class _$EventDateImpl extends _EventDate {
  _$EventDateImpl(
      {required this.datetime,
      required this.name,
      this.type = EventDateType.event,
      this.state = DateState.none})
      : super._();

  @override
  final DateTime datetime;
  @override
  final String name;
  @override
  @JsonKey()
  final EventDateType type;
  @override
  @JsonKey()
  final DateState state;

  @override
  String toString() {
    return 'EventDate(datetime: $datetime, name: $name, type: $type, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDateImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, datetime, name, type, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDateImplCopyWith<_$EventDateImpl> get copyWith =>
      __$$EventDateImplCopyWithImpl<_$EventDateImpl>(this, _$identity);
}

abstract class _EventDate extends EventDate {
  factory _EventDate(
      {required final DateTime datetime,
      required final String name,
      final EventDateType type,
      final DateState state}) = _$EventDateImpl;
  _EventDate._() : super._();

  @override
  DateTime get datetime;
  @override
  String get name;
  @override
  EventDateType get type;
  @override
  DateState get state;
  @override
  @JsonKey(ignore: true)
  _$$EventDateImplCopyWith<_$EventDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
