import 'package:equatable/equatable.dart';

abstract class HolidayEvent extends Equatable {}

class GetHolidayEvent extends HolidayEvent {
  GetHolidayEvent();

  @override
  List<Object> get props => [];
}
