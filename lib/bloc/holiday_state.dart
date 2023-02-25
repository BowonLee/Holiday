import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:holiday/model/holiday/holiday.dart';

@immutable
abstract class GetHolidayState extends Equatable {}

class HolidayEmpty extends GetHolidayState {
  @override
  List<Object?> get props => [];
}

class GetHolidayError extends GetHolidayState {
  final message;

  GetHolidayError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class GetHolidayLoading extends GetHolidayState {
  @override
  List<Object?> get props => [];
}

class GetHolidayLoaded extends GetHolidayState {
  final List<Holiday> holidayList;

  GetHolidayLoaded({required this.holidayList});

  @override
  List<Object?> get props => [holidayList];
}
