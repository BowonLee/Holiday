import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_event.dart';
import 'package:holiday/bloc/holiday_state.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';

import '../repository/holiday_repository.dart';

//
class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final HolidayRepository repository;

  HolidayBloc({required this.repository}) : super(Empty()) {
    on<ListHolidayEvent>(_listHolidayEventListener);
  }

  void _listHolidayEventListener(
      ListHolidayEvent event, Emitter<HolidayState> emitter) async {
    try {
      emitter(Loading());
      final resp = await repository.getHolidayList();

      resp.toWithoutWeekend().toEventDateList().toConsecutiveHolidaysList();

      // Logger().i(resp);
      emitter(Loaded(holidayList: resp));
    } catch (e) {
      emitter(Error(message: e.toString()));
    }
  }
}
