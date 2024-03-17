import 'package:get_it/get_it.dart';
import 'package:holiday/database/hive_helper.dart';

VacationRepository holidayRepositoryProvider() {
  // final client = GetIt.instance.get<>();
  /// 초기 단계에서는 회원 관리 공수 감안하여 local 저장 먼저 개발
  VacationRepository holidayRepository = VacationRepository();
  return holidayRepository;
}

class VacationRepository {
  getVacationList() {
    return HiveHelper().getVacationList();
  }

  setVacationList() {}
}
