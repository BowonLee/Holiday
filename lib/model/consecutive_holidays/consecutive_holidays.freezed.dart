// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consecutive_holidays.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConsecutiveHolidays {
  String get title => throw _privateConstructorUsedError;
  List<EventDate> get dateList => throw _privateConstructorUsedError;
  DateState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConsecutiveHolidaysCopyWith<ConsecutiveHolidays> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsecutiveHolidaysCopyWith<$Res> {
  factory $ConsecutiveHolidaysCopyWith(
          ConsecutiveHolidays value, $Res Function(ConsecutiveHolidays) then) =
      _$ConsecutiveHolidaysCopyWithImpl<$Res, ConsecutiveHolidays>;
  @useResult
  $Res call({String title, List<EventDate> dateList, DateState state});
}

/// @nodoc
class _$ConsecutiveHolidaysCopyWithImpl<$Res, $Val extends ConsecutiveHolidays>
    implements $ConsecutiveHolidaysCopyWith<$Res> {
  _$ConsecutiveHolidaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateList = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateList: null == dateList
          ? _value.dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<EventDate>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DateState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConsecutiveHolidaysCopyWith<$Res>
    implements $ConsecutiveHolidaysCopyWith<$Res> {
  factory _$$_ConsecutiveHolidaysCopyWith(_$_ConsecutiveHolidays value,
          $Res Function(_$_ConsecutiveHolidays) then) =
      __$$_ConsecutiveHolidaysCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<EventDate> dateList, DateState state});
}

/// @nodoc
class __$$_ConsecutiveHolidaysCopyWithImpl<$Res>
    extends _$ConsecutiveHolidaysCopyWithImpl<$Res, _$_ConsecutiveHolidays>
    implements _$$_ConsecutiveHolidaysCopyWith<$Res> {
  __$$_ConsecutiveHolidaysCopyWithImpl(_$_ConsecutiveHolidays _value,
      $Res Function(_$_ConsecutiveHolidays) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateList = null,
    Object? state = null,
  }) {
    return _then(_$_ConsecutiveHolidays(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateList: null == dateList
          ? _value._dateList
          : dateList // ignore: cast_nullable_to_non_nullable
              as List<EventDate>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DateState,
    ));
  }
}

/// @nodoc

class _$_ConsecutiveHolidays extends _ConsecutiveHolidays {
  _$_ConsecutiveHolidays(
      {required this.title,
      required final List<EventDate> dateList,
      required this.state})
      : _dateList = dateList,
        super._();

  @override
  final String title;
  final List<EventDate> _dateList;
  @override
  List<EventDate> get dateList {
    if (_dateList is EqualUnmodifiableListView) return _dateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateList);
  }

  @override
  final DateState state;

  @override
  String toString() {
    return 'ConsecutiveHolidays(title: $title, dateList: $dateList, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsecutiveHolidays &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._dateList, _dateList) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_dateList), state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsecutiveHolidaysCopyWith<_$_ConsecutiveHolidays> get copyWith =>
      __$$_ConsecutiveHolidaysCopyWithImpl<_$_ConsecutiveHolidays>(
          this, _$identity);
}

abstract class _ConsecutiveHolidays extends ConsecutiveHolidays {
  factory _ConsecutiveHolidays(
      {required final String title,
      required final List<EventDate> dateList,
      required final DateState state}) = _$_ConsecutiveHolidays;
  _ConsecutiveHolidays._() : super._();

  @override
  String get title;
  @override
  List<EventDate> get dateList;
  @override
  DateState get state;
  @override
  @JsonKey(ignore: true)
  _$$_ConsecutiveHolidaysCopyWith<_$_ConsecutiveHolidays> get copyWith =>
      throw _privateConstructorUsedError;
}
