import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holiday/bloc/app_init/app_init_bloc.dart';
import 'package:holiday/bloc/holiday_bloc/holiday_event.dart';

import 'package:holiday/layout/component/consecutive_holidays_card.dart';
import 'package:holiday/layout/component/next_consecutive_holidays.dart';
import 'package:holiday/model/consecutive_holidays/consecutive_holidays.dart';
import 'package:holiday/model/event_date/event_date_extension.dart';
import 'package:holiday/model/holiday/holiday.dart';
import 'package:holiday/model/holiday/holiday_extention.dart';
import 'package:holiday/repository/holiday_repository.dart';
import 'package:holiday/util/datetime_extentions.dart';

import '../../../bloc/holiday_bloc/holiday_bloc.dart';
import '../../../bloc/holiday_bloc/holiday_state.dart';
import '../../../theme_cubit/theme_cubit.dart';
import '../../component/consecutive_holidays_interval_card/consecutive_holidays_interval_card.dart';
import 'temp_home.dart';

class HomeBuilder extends StatelessWidget {
  final bool isNeedUpdateHoliday;

  const HomeBuilder({super.key, required this.isNeedUpdateHoliday});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HolidayBloc(
            holidayRepository: holidayRepositoryProvider(),
          ),
      child: _HomeBuilder(
        isNeedUpdateHoliday: isNeedUpdateHoliday,
      ),
    );
  }
}

class _HomeBuilder extends StatefulWidget {
  final bool isNeedUpdateHoliday;

  const _HomeBuilder({super.key, required this.isNeedUpdateHoliday});

  @override
  State<_HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<_HomeBuilder> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<HolidayBloc>(context).add(GetHolidayFromLocalEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HolidayBloc, HolidayBlocState>(
        builder: (_, state) {
          if (state is HolidayBlocError) {
            /// 모든 수단을 실패 error state
            return Container();
          }
          if (state is HolidayEmpty) {
            /// equal state loading
            return Container();
          }
          if (state is HolidayBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HolidayBlocLoaded) {
            // return HomeView(holidayList: state.holidayList);
          }
          return Container();
        },
      ),
    );
  }
}
