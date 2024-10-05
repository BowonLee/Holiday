import 'package:get_it/get_it.dart';
import 'package:holiday/domain/vacation/model/vacation.dart';

import '../../../core/repository/hive/hive_impl.dart';

const String VACATION_BOX_NAME = "VACATION_BOX";

void setUpVacationHive() {
  GetIt.instance.registerLazySingleton(() => VacationHiveService());
}

class VacationHiveService extends HiveListDataService {
  @override
  String boxName = "VACATION_BOX";
}
