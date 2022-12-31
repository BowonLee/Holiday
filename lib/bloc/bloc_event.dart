import 'package:equatable/equatable.dart';

import '../model/holiday/holiday.dart';

abstract class HolidayEvent extends Equatable {}

class ListHolidayEvent extends HolidayEvent {
  final List<Holiday> holidayList;

  ListHolidayEvent({required this.holidayList});
  @override
  List<Object> get props => [holidayList];
}
