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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$ConsecutiveHolidaysImplCopyWith<$Res>
    implements $ConsecutiveHolidaysCopyWith<$Res> {
  factory _$$ConsecutiveHolidaysImplCopyWith(_$ConsecutiveHolidaysImpl value,
          $Res Function(_$ConsecutiveHolidaysImpl) then) =
      __$$ConsecutiveHolidaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<EventDate> dateList, DateState state});
}

/// @nodoc
class __$$ConsecutiveHolidaysImplCopyWithImpl<$Res>
    extends _$ConsecutiveHolidaysCopyWithImpl<$Res, _$ConsecutiveHolidaysImpl>
    implements _$$ConsecutiveHolidaysImplCopyWith<$Res> {
  __$$ConsecutiveHolidaysImplCopyWithImpl(_$ConsecutiveHolidaysImpl _value,
      $Res Function(_$ConsecutiveHolidaysImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? dateList = null,
    Object? state = null,
  }) {
    return _then(_$ConsecutiveHolidaysImpl(
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

class _$ConsecutiveHolidaysImpl extends _ConsecutiveHolidays {
  _$ConsecutiveHolidaysImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsecutiveHolidaysImpl &&
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
  _$$ConsecutiveHolidaysImplCopyWith<_$ConsecutiveHolidaysImpl> get copyWith =>
      __$$ConsecutiveHolidaysImplCopyWithImpl<_$ConsecutiveHolidaysImpl>(
          this, _$identity);
}

abstract class _ConsecutiveHolidays extends ConsecutiveHolidays {
  factory _ConsecutiveHolidays(
      {required final String title,
      required final List<EventDate> dateList,
      required final DateState state}) = _$ConsecutiveHolidaysImpl;
  _ConsecutiveHolidays._() : super._();

  @override
  String get title;
  @override
  List<EventDate> get dateList;
  @override
  DateState get state;
  @override
  @JsonKey(ignore: true)
  _$$ConsecutiveHolidaysImplCopyWith<_$ConsecutiveHolidaysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
