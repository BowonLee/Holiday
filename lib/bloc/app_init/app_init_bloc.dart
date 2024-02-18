import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:holiday/model/metadata/update_datetime.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../repository/holiday_repository.dart';
import '../../repository/metadata_repository.dart';

part 'app_init_event.dart';

part 'app_init_state.dart';

class AppInitBloc extends Bloc<AppInitEvent, AppInitBlocState> {
  final MetadataRepository _metadataRepository;
  final HolidayRepository _holidayRepository;

  AppInitBloc({required MetadataRepository metadataRepository, required HolidayRepository holidayRepository})
      : _holidayRepository = holidayRepository,
        _metadataRepository = metadataRepository,
        super(AppInitInitial()) {
    on<AppInitEvent>(onStartApplication);
  }

  onStartApplication(AppInitEvent event, Emitter<AppInitBlocState> emit) async {
    /// 앱 시작 시 최초로 정보들을 업데이트 할 수 있는지 확인한다.
    /// 정보를 업데이트 할 필요하 있는 항목들을 체크한 뒤 해당 상태에 따라 이후 동작을 결정한다.
    emit(AppInitLoading());
    try {
      final List<UpdateDateTime> updateTimeList = await _metadataRepository.getMetaDataListFromServer();

      emit(AppInitComplete(
          needUpdateHolidayList: await _checkHolidayMeteData(
              updateTimeList.firstWhere((element) => element.typeName == "HOLIDAY").updateDateTime)));
    } on Exception catch (e) {
      Logger().e(e);
      emit(AppInitError(exception: e));
    }
  }

  Future<bool> _checkHolidayMeteData(DateTime lastUpdateTimeInResponse) async {
    final DateTime? lastUpdateDatetime = await _holidayRepository.getLastUpdateDatetime();

    if (lastUpdateDatetime == null || lastUpdateDatetime.isBefore(lastUpdateTimeInResponse)) {
      return false;
    }

    return true;
  }
}
