// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vacation _$VacationFromJson(Map<String, dynamic> json) {
  return _Vacation.fromJson(json);
}

/// @nodoc
mixin _$Vacation {
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  String get dateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VacationCopyWith<Vacation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacationCopyWith<$Res> {
  factory $VacationCopyWith(Vacation value, $Res Function(Vacation) then) =
      _$VacationCopyWithImpl<$Res, Vacation>;
  @useResult
  $Res call(
      {@JsonKey(name: "date", required: true) @HiveField(0) DateTime date,
      @HiveField(1) String dateName});
}

/// @nodoc
class _$VacationCopyWithImpl<$Res, $Val extends Vacation>
    implements $VacationCopyWith<$Res> {
  _$VacationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateName = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VacationImplCopyWith<$Res>
    implements $VacationCopyWith<$Res> {
  factory _$$VacationImplCopyWith(
          _$VacationImpl value, $Res Function(_$VacationImpl) then) =
      __$$VacationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date", required: true) @HiveField(0) DateTime date,
      @HiveField(1) String dateName});
}

/// @nodoc
class __$$VacationImplCopyWithImpl<$Res>
    extends _$VacationCopyWithImpl<$Res, _$VacationImpl>
    implements _$$VacationImplCopyWith<$Res> {
  __$$VacationImplCopyWithImpl(
      _$VacationImpl _value, $Res Function(_$VacationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dateName = null,
  }) {
    return _then(_$VacationImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateName: null == dateName
          ? _value.dateName
          : dateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: "VacationAdapter")
class _$VacationImpl with DiagnosticableTreeMixin implements _Vacation {
  const _$VacationImpl(
      {@JsonKey(name: "date", required: true) @HiveField(0) required this.date,
      @HiveField(1) required this.dateName});

  factory _$VacationImpl.fromJson(Map<String, dynamic> json) =>
      _$$VacationImplFromJson(json);

  @override
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final String dateName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vacation(date: $date, dateName: $dateName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vacation'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('dateName', dateName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacationImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateName, dateName) ||
                other.dateName == dateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, dateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VacationImplCopyWith<_$VacationImpl> get copyWith =>
      __$$VacationImplCopyWithImpl<_$VacationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VacationImplToJson(
      this,
    );
  }
}

abstract class _Vacation implements Vacation {
  const factory _Vacation(
      {@JsonKey(name: "date", required: true)
      @HiveField(0)
      required final DateTime date,
      @HiveField(1) required final String dateName}) = _$VacationImpl;

  factory _Vacation.fromJson(Map<String, dynamic> json) =
      _$VacationImpl.fromJson;

  @override
  @JsonKey(name: "date", required: true)
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  String get dateName;
  @override
  @JsonKey(ignore: true)
  _$$VacationImplCopyWith<_$VacationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
