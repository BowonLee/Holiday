import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/holiday_event.dart';
import 'package:holiday/bloc/holiday_state.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:logger/logger.dart';

import '../repository/holiday_repository.dart';

//
class HolidayBloc extends Bloc<HolidayEvent, GetHolidayState> {
  final HolidayRepository repository;

  HolidayBloc({required this.repository}) : super(HolidayEmpty()) {
    on<ListHolidayEvent>(_listHolidayEventListener);
  }

  void _listHolidayEventListener(
      ListHolidayEvent event, Emitter<GetHolidayState> emitter) async {
    try {
      emitter(GetHolidayLoading());
      final resp = await repository.getHolidayList();

      resp.toWithoutWeekend().toEventDateList().toConsecutiveHolidaysList();

      // Logger().i(resp);
      emitter(GetHolidayLoaded(holidayList: resp));
    } catch (e) {
      Logger().i(e);
      emitter(GetHolidayError(message: e.toString()));
    }
  }
}
