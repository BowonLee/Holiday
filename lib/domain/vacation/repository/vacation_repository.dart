import 'package:get_it/get_it.dart';
import 'package:holiday/core/repository/hive/hive_helper.dart';
import 'package:holiday/domain/vacation/model/vacation.dart';
import 'package:holiday/domain/vacation/repository/vacation_hive.dart';

VacationRepository holidayRepositoryProvider() {
  final hiveService = GetIt.instance.get<VacationHiveService>();

  /// 초기 단계에서는 회원 관리 공수 감안하여 local 저장 먼저 개발
  return VacationRepository(vacationHive: hiveService);
}

class VacationRepository {
  final VacationHiveService vacationHive;

  VacationRepository({required this.vacationHive});

  List<Vacation> cachedList = [];

  getVacationList() {
    return vacationHive.getList();
  }

  setVacationList(List<Vacation> list) {
    return vacationHive.setList(list);
  }
}
