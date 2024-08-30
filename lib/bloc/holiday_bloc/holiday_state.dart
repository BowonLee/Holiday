import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/holiday/model/holiday.dart';

@immutable
abstract class HolidayBlocState extends Equatable {}

class HolidayEmpty extends HolidayBlocState {
  @override
  List<Object?> get props => [];
}

class HolidayBlocError extends HolidayBlocState {
  final String message;

  HolidayBlocError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class HolidayBlocLoading extends HolidayBlocState {
  @override
  List<Object?> get props => [];
}

class HolidayBlocLoaded extends HolidayBlocState {
  final List<Holiday> holidayList;

  HolidayBlocLoaded({required this.holidayList});

  @override
  List<Object?> get props => [holidayList];
}
