import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:holiday/exception/DatabaseException.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:logger/logger.dart';

import '../../repository/holiday_repository.dart';

import 'holiday_event.dart';
import 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayBlocState> {
  final HolidayRepository holidayRepository;

  HolidayBloc({required this.holidayRepository}) : super(HolidayEmpty()) {
    on<GetHolidayFromLocalEvent>(_listHolidayFromLocal);
    on<UpdateAndGetHolidayEvent>(_listFromServer);
  }

  void _listHolidayFromLocal(GetHolidayFromLocalEvent event, Emitter<HolidayBlocState> emitter) async {
    emitter(HolidayBlocLoading());
    try {
      try {
        final List<Holiday>? holidayList = holidayRepository.getListFromDatabase();

        Logger().i("db");
        Logger().i(holidayList);
        if (holidayList == null || holidayList.isEmpty) {
          throw HolidayListEmptyError();
        } else {
          emitter(HolidayBlocLoaded(holidayList: holidayList));
        }
      } on HolidayListEmptyError catch (_, e) {
        final holidayList = await _getListFromAsset();
        emitter(HolidayBlocLoaded(holidayList: holidayList));
      } on HiveError catch (_, e) {
        final holidayList = await _getListFromAsset();
        emitter(HolidayBlocLoaded(holidayList: holidayList));
      }
    } on Exception catch (e) {
      emitter(HolidayBlocError(message: e.toString()));
    }
  }

  void _listFromServer(UpdateAndGetHolidayEvent event, Emitter<HolidayBlocState> emitter) async {
    emitter(HolidayBlocLoading());

    try {
      final response = await holidayRepository.getListFromSever();
      final DateTime? lastUpdateLocal = await holidayRepository.getLastUpdateDatetime();

      if (lastUpdateLocal == null || lastUpdateLocal.isBefore(response.lastUpdateTime)) {
        holidayRepository.setLastUpdateDate(response.lastUpdateTime);
        holidayRepository.setList(response.holidayList);
      }
      emitter(HolidayBlocLoaded(holidayList: response.holidayList));
    } on Exception catch (e) {
      emitter(HolidayBlocError(message: e.toString()));
    }
  }

  Future<List<Holiday>> _getListFromAsset() {
    Logger().i("asset");
    return holidayRepository.getListFromAsset();
  }
}
