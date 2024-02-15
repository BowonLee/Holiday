import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:holiday/model/holiday/holiday.dart';

@immutable
abstract class HolidayBlocState extends Equatable {}

class HolidayEmpty extends HolidayBlocState {
  @override
  List<Object?> get props => [];
}

class HolidayError extends HolidayBlocState {
  final String message;

  HolidayError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class HolidayLoading extends HolidayBlocState {
  @override
  List<Object?> get props => [];
}

class HolidayLoaded extends HolidayBlocState {
  final List<Holiday> holidayList;

  HolidayLoaded({required this.holidayList});

  @override
  List<Object?> get props => [holidayList];
}
