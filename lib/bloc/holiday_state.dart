import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:holiday/model/holiday/holiday.dart';

@immutable
abstract class HolidayState extends Equatable {}

class Empty extends HolidayState {
  @override
  List<Object?> get props => [];
}

class Error extends HolidayState {
  final message;

  Error({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class Loading extends HolidayState {
  @override
  List<Object?> get props => [];
}

class Loaded extends HolidayState {
  final List<Holiday> holidayList;

  Loaded({required this.holidayList});

  @override
  List<Object?> get props => [holidayList];
}
