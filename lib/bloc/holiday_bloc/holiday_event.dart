import 'package:equatable/equatable.dart';

abstract class HolidayEvent extends Equatable {}

class GetHolidayEvent extends HolidayEvent {
  GetHolidayEvent();

  @override
  List<Object> get props => [];
}

/// 서버로부터 신규 데이터를 업데이트 한다.
class UpdateHolidayEvent extends HolidayEvent {
  @override
  List<Object> get props => [];
}
