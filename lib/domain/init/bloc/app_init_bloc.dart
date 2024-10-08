import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:holiday/domain/init/model/update_datetime.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../holiday/repository/holiday_repository.dart';
import '../client/metadata_repository.dart';

part 'app_init_event.dart';

part 'app_init_state.dart';

class AppInitBloc extends Bloc<AppInitEvent, AppInitBlocState> {
  final MetadataRepository _metadataRepository;
  final HolidayRepository _holidayRepository;

  AppInitBloc(
      {required MetadataRepository metadataRepository,
      required HolidayRepository holidayRepository})
      : _holidayRepository = holidayRepository,
        _metadataRepository = metadataRepository,
        super(AppInitBlocInitial()) {
    on<GetMetaDataEvent>(onStartApplication);
  }

  onStartApplication(AppInitEvent event, Emitter<AppInitBlocState> emitter) async {
    /// 앱 시작 시 최초로 정보들을 업데이트 할 수 있는지 확인한다.
    /// 정보를 업데이트 할 필요하 있는 항목들을 체크한 뒤 해당 상태에 따라 이후 동작을 결정한다.
    emitter(AppInitBlocLoading());
    try {
      final List<UpdateDateTime> updateTimeList =
          await _metadataRepository.getMetaDataListFromServer();

      Logger().i(updateTimeList
          .firstWhere(
            (element) => element.typeName == "HOLIDAY",
          )
          .updateDateTime);
      final needUpdate = _checkHolidayMeteData(
          updateTimeList.firstWhere((element) => element.typeName == "HOLIDAY").updateDateTime);

      emitter(AppInitBlocComplete(needUpdateHolidayList: needUpdate));
    } on Exception catch (e) {
      emitter(AppInitBlocError(exception: e));
    }
  }

  bool _checkHolidayMeteData(DateTime lastUpdateTimeInResponse) {
    Logger().i(lastUpdateTimeInResponse);
    final DateTime? lastUpdateDatetime = _holidayRepository.getLastUpdateDatetime();
    Logger().i(lastUpdateDatetime);

    if (lastUpdateDatetime == null || lastUpdateDatetime.isBefore(lastUpdateTimeInResponse)) {
      return true;
    }

    return false;
  }
}
