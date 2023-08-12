import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'holiday_state.dart';

/// 데이터만을 관리한다.
class HolidayCubit extends Cubit<HolidayState> {
  HolidayCubit() : super(HolidayInitial());
}
