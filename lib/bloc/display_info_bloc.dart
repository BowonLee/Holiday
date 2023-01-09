import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/bloc_event.dart';
import 'package:holiday/bloc/bloc_state.dart';

import '../model/holiday/holiday.dart';
import '../repository/holiday_repository.dart';

//
class DisplayInfoBloc extends Bloc<HolidayEvent, HolidayState> {
  final HolidayRepository repository;

  DisplayInfoBloc({required this.repository}) : super(Empty());

  @override
  Stream<HolidayState> mapEventToState(HolidayEvent event) async* {
    if (event is ListHolidayEvent) {
      yield* _mapListHolidayEvent(event);
    }
  }

  Stream<HolidayState> _mapListHolidayEvent(ListHolidayEvent event) async* {
    try {
      yield Loading();
      final resp = await this.repository.getHolidayList();

      resp.map<Holiday>((el) => el);

      // Loaded(holidayList: resp);
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
