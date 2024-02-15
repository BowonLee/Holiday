import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../repository/holiday_repository.dart';

import 'holiday_event.dart';
import 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayBlocState> {
  final HolidayRepository holidayRepository;

  HolidayBloc({required this.holidayRepository}) : super(HolidayEmpty()) {
    on<GetHolidayEvent>(_listHolidayEventListener);
  }

  void _listHolidayEventListener(GetHolidayEvent event, Emitter<HolidayBlocState> emitter) async {
    emitter(HolidayLoading());
    try {
      final holidayList = holidayRepository.getListFromDatabase();

      emitter(HolidayLoaded(holidayList: holidayList));
    } catch (e) {
      Logger().i(e);
      emitter(HolidayError(message: e.toString()));
    }
  }

  void _getNewListFromServer(GetHolidayEvent event, Emitter<HolidayBlocState> emitter) async {
    emitter(HolidayLoading());

    try {
      final response = await holidayRepository.getListFromSever();
      final DateTime lastUpdateLocal = await holidayRepository.getLastUpdateDatetime();

      if (lastUpdateLocal.isBefore(response.lastUpdateTime)) {
        holidayRepository.setLastUpdateDate(response.lastUpdateTime);
        holidayRepository.setList(response.holidayList);
      }
      emitter(HolidayLoaded(holidayList: response.holidayList));
    } catch (e) {}
  }
}
