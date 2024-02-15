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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HolidayBloc(
        holidayRepository: holidayRepositoryProvider(),
      ),
      child: const _HomeBuilder(),
    );
  }
}

class _HomeBuilder extends StatefulWidget {
  const _HomeBuilder({Key? key}) : super(key: key);

  @override
  State<_HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<_HomeBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppInitBloc>(context).add(GetMetaDataEvent());
    BlocProvider.of<HolidayBloc>(context).add(GetHolidayEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HolidayBloc, HolidayBlocState>(
        builder: (_, state) {
          if (state is HolidayError) {
            return Container();
          }
          if (state is HolidayEmpty) {
            return Container();
          }
          if (state is HolidayLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HolidayLoaded) {
            // return HomeView(holidayList: state.holidayList);
          }
          return Container();
        },
      ),
    );
  }
}
