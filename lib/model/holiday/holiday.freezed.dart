// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HolidayResponse _$HolidayResponseFromJson(Map<String, dynamic> json) {
  return _HolidayResponse.fromJson(json);
}

/// @nodoc
mixin _$HolidayResponse {
  List<Holiday> get holidayList => throw _privateConstructorUsedError;
  DateTime get lastUpdateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HolidayResponseCopyWith<HolidayResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayResponseCopyWith<$Res> {
  factory $HolidayResponseCopyWith(
          HolidayResponse value, $Res Function(HolidayResponse) then) =
      _$HolidayResponseCopyWithImpl<$Res, HolidayResponse>;
  @useResult
  $Res call({List<Holiday> holidayList, DateTime lastUpdateTime});
}

/// @nodoc
class _$HolidayResponseCopyWithImpl<$Res, $Val extends HolidayResponse>
    implements $HolidayResponseCopyWith<$Res> {
  _$HolidayResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidayList = null,
    Object? lastUpdateTime = null,
  }) {
    return _then(_value.copyWith(
      holidayList: null == holidayList
          ? _value.holidayList
          : holidayList // ignore: cast_nullable_to_non_nullable
              as List<Holiday>,
      lastUpdateTime: null == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayResponseImplCopyWith<$Res>
    implements $HolidayResponseCopyWith<$Res> {
  factory _$$HolidayResponseImplCopyWith(_$HolidayResponseImpl value,
          $Res Function(_$HolidayResponseImpl) then) =
      __$$HolidayResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Holiday> holidayList, DateTime lastUpdateTime});
}

/// @nodoc
class __$$HolidayResponseImplCopyWithImpl<$Res>
    extends _$HolidayResponseCopyWithImpl<$Res, _$HolidayResponseImpl>
    implements _$$HolidayResponseImplCopyWith<$Res> {
  __$$HolidayResponseImplCopyWithImpl(
      _$HolidayResponseImpl _value, $Res Function(_$HolidayResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidayList = null,
    Object? lastUpdateTime = null,
  }) {
    return _then(_$HolidayResponseImpl(
      holidayList: null == holidayList
          ? _value._holidayList
          : holidayList // ignore: cast_nullable_to_non_nullable
              as List<Holiday>,
      lastUpdateTime: null == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HolidayResponseImpl implements _HolidayResponse {
  const _$HolidayResponseImpl(
      {required final List<Holiday> holidayList, required this.lastUpdateTime})
      : _holidayList = holidayList;

  factory _$HolidayResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayResponseImplFromJson(json);

  final List<Holiday> _holidayList;
  @override
  List<Holiday> get holidayList {
    if (_holidayList is EqualUnmodifiableListView) return _holidayList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holidayList);
  }

  @override
  final DateTime lastUpdateTime;

  @override
  String toString() {
    return 'HolidayResponse(holidayList: $holidayList, lastUpdateTime: $lastUpdateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._holidayList, _holidayList) &&
            (identical(other.lastUpdateTime, lastUpdateTime) ||
                other.lastUpdateTime == lastUpdateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_holidayList), lastUpdateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayResponseImplCopyWith<_$HolidayResponseImpl> get copyWith =>
      __$$HolidayResponseImplCopyWithImpl<_$HolidayResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayResponseImplToJson(
      this,
    );
  }
}

abstract class _HolidayResponse implements HolidayResponse {
  const factory _HolidayResponse(
      {required final List<Holiday> holidayList,
      required final DateTime lastUpdateTime}) = _$HolidayResponseImpl;

  factory _HolidayResponse.fromJson(Map<String, dynamic> json) =
      _$HolidayResponseImpl.fromJson;

  @override
  List<Holiday> get holidayList;
  @override
  DateTime get lastUpdateTime;
  @override
  @JsonKey(ignore: true)
  _$$HolidayResponseImplCopyWith<_$HolidayResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Holiday _$HolidayFromJson(Map<String, dynamic> json) {
  return _Holiday.fromJson(json);
}

/// @nodoc
mixin _$Holiday {
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  String get dateName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get dateKind => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isHoliday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HolidayCopyWith<Holiday> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res, Holiday>;
  @useResult
  $Res call(
      {@JsonKey(name: "date", required: true) @HiveField(0) DateTime date,
      @HiveField(1) String dateName,
      @HiveField(2) String dateKind,
      @HiveField(3) bool isHoliday});
}

/// @nodoc
class _$HolidayCopyWithImpl<$Res, $Val extends Holiday>
    implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateName = null,
    Object? dateKind = null,
    Object? isHoliday = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateName: null == dateName
          ? _value.dateName
          : dateName // ignore: cast_nullable_to_non_nullable
              as String,
      dateKind: null == dateKind
          ? _value.dateKind
          : dateKind // ignore: cast_nullable_to_non_nullable
              as String,
      isHoliday: null == isHoliday
          ? _value.isHoliday
          : isHoliday // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayImplCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$$HolidayImplCopyWith(
          _$HolidayImpl value, $Res Function(_$HolidayImpl) then) =
      __$$HolidayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date", required: true) @HiveField(0) DateTime date,
      @HiveField(1) String dateName,
      @HiveField(2) String dateKind,
      @HiveField(3) bool isHoliday});
}

/// @nodoc
class __$$HolidayImplCopyWithImpl<$Res>
    extends _$HolidayCopyWithImpl<$Res, _$HolidayImpl>
    implements _$$HolidayImplCopyWith<$Res> {
  __$$HolidayImplCopyWithImpl(
      _$HolidayImpl _value, $Res Function(_$HolidayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateName = null,
    Object? dateKind = null,
    Object? isHoliday = null,
  }) {
    return _then(_$HolidayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateName: null == dateName
          ? _value.dateName
          : dateName // ignore: cast_nullable_to_non_nullable
              as String,
      dateKind: null == dateKind
          ? _value.dateKind
          : dateKind // ignore: cast_nullable_to_non_nullable
              as String,
      isHoliday: null == isHoliday
          ? _value.isHoliday
          : isHoliday // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: "HolidayAdapter")
class _$HolidayImpl extends _Holiday {
  _$HolidayImpl(
      {@JsonKey(name: "date", required: true) @HiveField(0) required this.date,
      @HiveField(1) required this.dateName,
      @HiveField(2) required this.dateKind,
      @HiveField(3) required this.isHoliday})
      : super._();

  factory _$HolidayImpl.fromJson(Map<String, dynamic> json) =>
      _$$HolidayImplFromJson(json);

  @override
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final String dateName;
  @override
  @HiveField(2)
  final String dateKind;
  @override
  @HiveField(3)
  final bool isHoliday;

  @override
  String toString() {
    return 'Holiday(date: $date, dateName: $dateName, dateKind: $dateKind, isHoliday: $isHoliday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateName, dateName) ||
                other.dateName == dateName) &&
            (identical(other.dateKind, dateKind) ||
                other.dateKind == dateKind) &&
            (identical(other.isHoliday, isHoliday) ||
                other.isHoliday == isHoliday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, dateName, dateKind, isHoliday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayImplCopyWith<_$HolidayImpl> get copyWith =>
      __$$HolidayImplCopyWithImpl<_$HolidayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HolidayImplToJson(
      this,
    );
  }
}

abstract class _Holiday extends Holiday {
  factory _Holiday(
      {@JsonKey(name: "date", required: true)
      @HiveField(0)
      required final DateTime date,
      @HiveField(1) required final String dateName,
      @HiveField(2) required final String dateKind,
      @HiveField(3) required final bool isHoliday}) = _$HolidayImpl;
  _Holiday._() : super._();

  factory _Holiday.fromJson(Map<String, dynamic> json) = _$HolidayImpl.fromJson;

  @override
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  String get dateName;
  @override
  @HiveField(2)
  String get dateKind;
  @override
  @HiveField(3)
  bool get isHoliday;
  @override
  @JsonKey(ignore: true)
  _$$HolidayImplCopyWith<_$HolidayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
